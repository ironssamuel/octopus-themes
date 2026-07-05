# Octopus theme test — Platform Engineer persona
# Provisions the Octopus project/environment structure itself via the
# official Octopus Deploy Terraform provider, plus the cloud infra it
# deploys onto. This is "the system that configures the deployment system."
# Exercises: HCL blocks, string interpolation, comment, number, punctuation,
# heredoc strings, type-like references (resource types)

terraform {
  required_providers {
    octopusdeploy = {
      source  = "OctopusDeployLabs/octopusdeploy"
      version = "~> 0.30"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

variable "octopus_space_id" {
  description = "The Octopus space to provision resources into"
  type        = string
}

variable "environment_names" {
  description = "Ordered list of lifecycle environments"
  type        = list(string)
  default     = ["Development", "Staging", "Production"]
}

resource "octopusdeploy_environment" "environments" {
  for_each = toset(var.environment_names)

  name                         = each.value
  space_id                     = var.octopus_space_id
  use_guided_failure           = each.value == "Production"
  allow_dynamic_infrastructure = true

  description = <<-EOT
    Auto-provisioned ${each.value} environment.
    Managed by Terraform — do not edit manually in the Octopus UI.
  EOT
}

# Octopus theme test — Platform Engineer persona

resource "octopusdeploy_lifecycle" "standard_release_cadence" {
  name        = "Standard Release Cadence"
  space_id    = var.octopus_space_id
  description = "Dev requires no approval; Staging and Production require manual promotion."

  phase {
    name                            = "Development"
    automatic_deployment_targets    = [octopusdeploy_environment.environments["Development"].id]
    is_optional_phase               = false
    minimum_environments_before_promotion = 0
  }

  phase {
    name                          = "Production"
    optional_deployment_targets   = [octopusdeploy_environment.environments["Production"].id]
    minimum_environments_before_promotion = 1
  }
}

resource "azurerm_resource_group" "deployment_targets" {
  name     = "rg-octopus-targets-${var.octopus_space_id}"
  location = "australiaeast"

  tags = {
    ManagedBy   = "terraform"
    Purpose     = "octopus-deployment-target"
    ReviewAfter = "2027-01-01"
  }
}

output "environment_ids" {
  value = { for name, env in octopusdeploy_environment.environments : name => env.id }
}
