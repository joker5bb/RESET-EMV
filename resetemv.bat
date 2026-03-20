@echo off
title EMV Card Parameter Reset Tool
echo ==========================================
echo    EMV Card Parameter Reset Utility
echo ==========================================
echo.

:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: Administrator privileges required!
    echo Please run this batch file as Administrator.
    pause
    exit /b 1
)

echo [*] Resetting EMV Card Parameters...
echo.

:: Reset ARQC (Authorization Request Cryptogram)
echo [1] Resetting ARQC (Authorization Request Cryptogram)...
reg delete "HKLM\SOFTWARE\EMV\ARQC" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo     [OK] ARQC registry entries cleared
) else (
    echo     [INFO] No ARQC entries found or access denied
)

:: Reset ATC (Application Transaction Counter)
echo [2] Resetting ATC (Application Transaction Counter)...
reg delete "HKLM\SOFTWARE\EMV\ATC" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo     [OK] ATC registry entries cleared
) else (
    echo     [INFO] No ATC entries found or access denied
)

:: Reset TVR (Terminal Verification Results)
echo [3] Resetting TVR (Terminal Verification Results)...
reg delete "HKLM\SOFTWARE\EMV\TVR" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo     [OK] TVR registry entries cleared
) else (
    echo     [INFO] No TVR entries found or access denied
)

:: Reset AIP (Application Interchange Profile)
echo [4] Resetting AIP (Application Interchange Profile)...
reg delete "HKLM\SOFTWARE\EMV\AIP" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo     [OK] AIP registry entries cleared
) else (
    echo     [INFO] No AIP entries found or access denied
)

echo.
echo ==========================================
echo    Reset Operations Completed
echo ==========================================
echo.
echo NOTE: This tool clears EMV parameter registry entries.
echo For physical card operations, use your payment terminal
echo manufacturer's diagnostic tools or SDK.
echo.
pause