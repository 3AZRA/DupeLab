@echo off
setlocal
where gradle >nul 2>nul
if errorlevel 1 (
  echo Gradle was not found. Install Gradle 9.4.0 and add it to PATH.
  echo See README.md for setup instructions.
  exit /b 1
)
gradle build
exit /b %errorlevel%
