$ErrorActionPreference = "Stop"

if (-not (Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host "Se creo .env a partir de .env.example"
}

New-Item -ItemType Directory -Force ".deploy" | Out-Null
New-Item -ItemType Directory -Force "deployment_logs" | Out-Null

& "$PSScriptRoot/build_version.ps1" -Version "1.0" -ForceUnhealthy "false"

$env:API_IMAGE = "api:1.0"
docker compose up -d

Set-Content ".deploy/current_version" "1.0"

Write-Host ""
Write-Host "API iniciada en http://localhost:8000"
Write-Host "Swagger: http://localhost:8000/docs"
Write-Host "Usuario demo: demo@adaii.local / Demo123!"
