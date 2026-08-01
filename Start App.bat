@echo off
setlocal enabledelayedexpansion
title Secure Pass Gen - Startup
cd /d "%~dp0"

echo ============================================
echo   Secure Pass Gen - Windows Startup Script
echo ============================================
echo.

REM --- Step 1: Verify Python is installed ---
echo [1/6] Checking for Python...
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Python was not found on this system.
    echo Please install Python from https://www.python.org/downloads/
    echo IMPORTANT: During install, check "Add python.exe to PATH".
    echo.
    pause
    exit /b 1
)
echo       Python found.
echo.

REM --- Step 2: Create virtual environment if it doesn't exist ---
echo [2/6] Checking for virtual environment...
if not exist "venv\Scripts\activate.bat" (
    echo       No virtual environment found. Creating one now...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Failed to create the virtual environment.
        pause
        exit /b 1
    )
    echo       Virtual environment created.
) else (
    echo       Virtual environment already exists.
)
echo.

REM --- Step 3: Activate virtual environment ---
echo [3/6] Activating virtual environment...
call "venv\Scripts\activate.bat"
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Failed to activate the virtual environment.
    pause
    exit /b 1
)
echo       Virtual environment activated.
echo.

REM --- Step 4: Install missing dependencies ---
echo [4/6] Checking dependencies...
python -c "import customtkinter" >nul 2>nul
if %errorlevel% neq 0 (
    echo       Installing missing dependency: customtkinter...
    pip install customtkinter
    if %errorlevel% neq 0 (
        echo.
        echo [ERROR] Failed to install dependencies.
        pause
        exit /b 1
    )
) else (
    echo       All dependencies already installed.
)
echo.

REM --- Step 5: Verify .env file (optional for this project) ---
echo [5/6] Checking for .env file...
if exist ".env.example" (
    if not exist ".env" (
        echo       No .env file found. Copying from .env.example...
        copy ".env.example" ".env" >nul
        echo       Created .env - please review it before continuing.
    ) else (
        echo       .env file found.
    )
) else (
    echo       No .env.example present - this project does not require one.
)
echo.

REM --- Step 6: Launch the application ---
echo [6/6] Launching Secure Pass Gen...
echo.
python "Password_Gen.py"

if %errorlevel% neq 0 (
    echo.
    echo ============================================
    echo   The application closed with an error.
    echo   See the message above for details.
    echo ============================================
    pause
    exit /b 1
)

echo.
echo Application closed normally.
pause
