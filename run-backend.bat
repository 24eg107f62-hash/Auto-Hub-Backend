@echo off
echo ===================================================
echo  Starting AUTO HUB Spring Boot Backend (Port 8081)
echo ===================================================
cd /d "%~dp0\backend"
mvn spring-boot:run
pause
