param(
    [string]$Version = "1.0",
    [string]$ForceUnhealthy = "false"
)

$ErrorActionPreference = "Stop"

Write-Host "Construyendo api:$Version (FORCE_UNHEALTHY=$ForceUnhealthy)"

docker build `
    --build-arg "API_VERSION=$Version" `
    --build-arg "FORCE_UNHEALTHY=$ForceUnhealthy" `
    -t "api:$Version" `
    .
