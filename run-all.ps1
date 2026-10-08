# =========================================================
# AUTO HUB - Quick Launch Script for Windows PowerShell
# =========================================================

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Launching Auto Hub Vehicle Service Management System     " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

$root = $PSScriptRoot

Write-Host "[1/2] Starting Spring Boot Backend on http://localhost:8081 ..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$root\backend'; mvn spring-boot:run"

Start-Sleep -Seconds 3

Write-Host "[2/2] Starting React Frontend on http://localhost:5173 ..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$root\frontend'; npm run dev"

Write-Host "`nBoth processes launched in separate windows!" -ForegroundColor Magenta
Write-Host "Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host "Backend API: http://localhost:8081/api" -ForegroundColor Cyan
