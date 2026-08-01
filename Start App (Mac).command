#!/bin/bash

# Secure Pass Gen - macOS Startup Script
# Double-click this file to run. If macOS blocks it the first time,
# right-click the file -> Open, then confirm "Open" in the dialog.

cd "$(dirname "$0")"

echo "============================================"
echo "  Secure Pass Gen - macOS Startup Script"
echo "============================================"
echo

fail() {
    echo
    echo "[ERROR] $1"
    echo
    read -n 1 -s -r -p "Press any key to close this window..."
    exit 1
}

# --- Step 1: Verify Python is installed ---
echo "[1/6] Checking for Python..."
if command -v python3 >/dev/null 2>&1; then
    PYTHON_CMD=python3
elif command -v python >/dev/null 2>&1; then
    PYTHON_CMD=python
else
    fail "Python was not found. Install it from https://www.python.org/downloads/ and try again."
fi
echo "      Python found ($PYTHON_CMD)."
echo

# --- Step 2: Create virtual environment if it doesn't exist ---
echo "[2/6] Checking for virtual environment..."
if [ ! -f "venv/bin/activate" ]; then
    echo "      No virtual environment found. Creating one now..."
    "$PYTHON_CMD" -m venv venv || fail "Failed to create the virtual environment."
    echo "      Virtual environment created."
else
    echo "      Virtual environment already exists."
fi
echo

# --- Step 3: Activate virtual environment ---
echo "[3/6] Activating virtual environment..."
source "venv/bin/activate" || fail "Failed to activate the virtual environment."
echo "      Virtual environment activated."
echo

# --- Step 4: Install missing dependencies ---
echo "[4/6] Checking dependencies..."
if ! python -c "import customtkinter" >/dev/null 2>&1; then
    echo "      Installing missing dependency: customtkinter..."
    pip install customtkinter || fail "Failed to install dependencies."
else
    echo "      All dependencies already installed."
fi
echo

# --- Step 5: Verify .env file (optional for this project) ---
echo "[5/6] Checking for .env file..."
if [ -f ".env.example" ]; then
    if [ ! -f ".env" ]; then
        echo "      No .env file found. Copying from .env.example..."
        cp ".env.example" ".env"
        echo "      Created .env - please review it before continuing."
    else
        echo "      .env file found."
    fi
else
    echo "      No .env.example present - this project does not require one."
fi
echo

# --- Step 6: Launch the application ---
echo "[6/6] Launching Secure Pass Gen..."
echo
python "Password_Gen.py"
STATUS=$?

if [ $STATUS -ne 0 ]; then
    echo
    echo "============================================"
    echo "  The application closed with an error."
    echo "  See the message above for details."
    echo "============================================"
    read -n 1 -s -r -p "Press any key to close this window..."
    exit 1
fi

echo
echo "Application closed normally."
read -n 1 -s -r -p "Press any key to close this window..."
