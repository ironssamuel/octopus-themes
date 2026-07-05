# Octopus theme test — DevOps Engineer persona
# A pre-deployment script for an Octopus deployment process, the kind that
# runs as a "Deploy a Package" step or standalone runbook.
# Exercises: variable.special ($_, $env:, automatic variables), string
# interpolation, keyword, function, comment, number, operator

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PackageVersion,

    [int]$MaxRetries = 3,

    [switch]$SkipHealthCheck
)

$ErrorActionPreference = "Stop"
$deployTimeoutSeconds = 300

# Octopus injects these as script variables at runtime — referenced here
# using the #{...} substitution syntax as well as $OctopusParameters.
$environmentName = $OctopusParameters["Octopus.Environment.Name"]
$releaseNumber   = $OctopusParameters["Octopus.Release.Number"]
$tenantName      = $OctopusParameters["Octopus.Deployment.Tenant.Name"]

Write-Host "Deploying release $releaseNumber to $environmentName" -ForegroundColor Cyan

function Test-ServiceHealth {
    param(
        [string]$Url,
        [int]$TimeoutSeconds = 30
    )

    try {
        $response = Invoke-WebRequest -Uri $Url -TimeoutSec $TimeoutSeconds -UseBasicParsing
        return $response.StatusCode -eq 200
    }
    catch {
        Write-Warning "Health check failed: $($_.Exception.Message)"
        return $false
    }
}

function Invoke-WithRetry {
    param(
        [scriptblock]$Action,
        [int]$MaxAttempts = 3,
        [int]$DelaySeconds = 5
    )

    $attempt = 0
    while ($attempt -lt $MaxAttempts) {
        try {
            return & $Action
        }
        catch {
            $attempt++
            if ($attempt -ge $MaxAttempts) {
                throw
            }
            Write-Host "Attempt $attempt/$MaxAttempts failed, retrying in ${DelaySeconds}s..."
            Start-Sleep -Seconds $DelaySeconds
        }
    }
}

if (-not $SkipHealthCheck) {
    $healthUrl = "https://$environmentName.internal.contoso.com/api/release/health"
    $isHealthy = Invoke-WithRetry -Action { Test-ServiceHealth -Url $healthUrl } -MaxAttempts $MaxRetries

    if (-not $isHealthy) {
        Write-Error "Service failed health check after $MaxRetries attempts. Aborting deployment."
        exit 1
    }
}

if ($tenantName) {
    Write-Host "Tenant-specific deployment for: $tenantName"
}

$deployedPackages = Get-ChildItem -Path $OctopusParameters["Octopus.Action.Package.InstallationDirectoryPath"] -Filter "*.dll" |
    Where-Object { $_.Name -notlike "*.Tests.dll" } |
    Select-Object -ExpandProperty Name

Write-Host "Deployed $($deployedPackages.Count) assemblies for version $PackageVersion"

New-OctopusArtifact -Path "deployment-summary.json" -Name "DeploymentSummary"
