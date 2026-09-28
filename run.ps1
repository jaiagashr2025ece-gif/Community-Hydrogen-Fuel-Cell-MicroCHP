$ErrorActionPreference = "SilentlyContinue"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

if (Test-Path "C:\Users\agash\.jdks\ms-17.0.20.1\bin\java.exe") {
    $env:JAVA_HOME = "C:\Users\agash\.jdks\ms-17.0.20.1"
    $env:PATH = "$env:JAVA_HOME\bin;$($env:PATH)"
}

Get-NetTCPConnection -LocalPort 8080 -State Listen -ErrorAction SilentlyContinue | ForEach-Object {
    Stop-Process -Id $_.OwningProcess -Force -ErrorAction SilentlyContinue
}

Write-Host "====================================================================" -ForegroundColor Cyan
Write-Host " Starting Community Hydrogen Fuel Cell Micro-CHP Platform" -ForegroundColor Green
Write-Host " Java:  $env:JAVA_HOME" -ForegroundColor Gray
Write-Host " URL:   http://localhost:8080" -ForegroundColor Yellow
Write-Host " Admin: jaiagash.r2025ece@sece.ac.in / admin123" -ForegroundColor Yellow
Write-Host "====================================================================" -ForegroundColor Cyan

& .\mvnw.cmd spring-boot:run
