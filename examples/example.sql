-- Octopus theme test — SQL
-- ~59% developer usage (Stack Overflow 2025), structurally unlike anything
-- else tested: no braces, ALL-CAPS keyword convention, different
-- punctuation rhythm. Exercises: CTEs, window functions, joins, comments,
-- string/numeric literals, boolean logic.

WITH recent_deployments AS (
    SELECT
        d.id,
        d.release_version,
        d.environment,
        d.status,
        d.deployed_at,
        p.name AS project_name,
        ROW_NUMBER() OVER (
            PARTITION BY d.environment
            ORDER BY d.deployed_at DESC
        ) AS rn
    FROM deployments d
    INNER JOIN projects p ON p.id = d.project_id
    WHERE d.deployed_at >= NOW() - INTERVAL '30 days'
      AND d.status IN ('succeeded', 'failed')
),

failure_rates AS (
    SELECT
        environment,
        COUNT(*) AS total_deployments,
        SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) AS failed_count,
        ROUND(
            100.0 * SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) / COUNT(*),
            2
        ) AS failure_pct
    FROM recent_deployments
    GROUP BY environment
    HAVING COUNT(*) > 5
)

SELECT
    rd.project_name,
    rd.release_version,
    rd.environment,
    rd.status,
    rd.deployed_at,
    fr.failure_pct,
    CASE
        WHEN fr.failure_pct > 20.0 THEN 'unstable'
        WHEN fr.failure_pct > 5.0 THEN 'watch'
        ELSE 'healthy'
    END AS environment_health
FROM recent_deployments rd
LEFT JOIN failure_rates fr ON fr.environment = rd.environment
WHERE rd.rn = 1
ORDER BY fr.failure_pct DESC NULLS LAST, rd.deployed_at DESC
LIMIT 50;
