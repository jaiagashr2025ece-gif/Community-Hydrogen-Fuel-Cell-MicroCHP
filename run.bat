@echo off
title H2-CHP Energy Network
cd /d "%~dp0"

if exist "C:\Users\agash\.jdks\ms-17.0.20.1\bin\java.exe" (
    set "JAVA_HOME=C:\Users\agash\.jdks\ms-17.0.20.1"
    set "PATH=C:\Users\agash\.jdks\ms-17.0.20.1\bin;%PATH%"
)

for /f "tokens=5" %%a in ('netstat -aon ^| findstr :8080 ^| findstr LISTENING') do taskkill /F /PID %%a >nul 2>&1

echo ====================================================================
echo Starting Community Hydrogen Fuel Cell Micro-CHP Platform
echo Java:  %JAVA_HOME%
echo URL:   http://localhost:8080
echo Admin: jaiagash.r2025ece@sece.ac.in / admin123
echo ====================================================================

call .\mvnw.cmd spring-boot:run
pause
