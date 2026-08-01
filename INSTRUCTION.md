# INSTRUCTION.md - Complete Beginner's Guide to Running Secure Pass Gen

This guide assumes you have **never** used Python, Git, Visual Studio Code, a terminal, or a virtual environment before. Follow every step in order and you will have the app running.

---

## Table of Contents

1. [Installing Python](#1-installing-python)
2. [Installing Git](#2-installing-git)
3. [Installing Visual Studio Code](#3-installing-visual-studio-code)
4. [Recommended VS Code Extensions](#4-recommended-vs-code-extensions)
5. [Opening the Project](#5-opening-the-project)
6. [Creating a Virtual Environment](#6-creating-a-virtual-environment)
7. [Activating the Virtual Environment](#7-activating-the-virtual-environment)
8. [Installing Dependencies](#8-installing-dependencies)
9. [Creating the .env File](#9-creating-the-env-file)
10. [Running the Application](#10-running-the-application)
11. [Testing the Application](#11-testing-the-application)
12. [Using Every Feature](#12-using-every-feature)
13. [Troubleshooting](#13-troubleshooting)
14. [FAQ](#14-faq)
15. [Common Mistakes](#15-common-mistakes)
16. [Security Recommendations](#16-security-recommendations)
17. [Next Learning Steps](#17-next-learning-steps)

---

## 1. Installing Python

Python is the programming language this app is written in.

1. Go to [https://www.python.org/downloads/](https://www.python.org/downloads/).
2. Click the yellow **"Download Python 3.x.x"** button (any version 3.8 or newer works).
3. Run the installer.
   - **Windows:** On the very first screen, make sure you **check the box "Add python.exe to PATH"** before clicking "Install Now". This step is critical - if you skip it, the terminal won't recognize the `python` command.
   - **macOS:** Run the downloaded `.pkg` file and follow the prompts.
4. When installation finishes, verify it worked:
   - Open a terminal (see [Common Mistakes](#15-common-mistakes) if you don't know how to open one).
   - Type:
     ```bash
     python --version
     ```
     (On macOS you may need `python3 --version` instead.)
   - You should see something like `Python 3.12.1`.

## 2. Installing Git

Git lets you download ("clone") this project from GitHub.

1. Go to [https://git-scm.com/downloads](https://git-scm.com/downloads).
2. Download the installer for your operating system and run it.
3. On Windows, the default options during installation are fine - just keep clicking "Next".
4. Verify it worked by opening a terminal and typing:
   ```bash
   git --version
   ```
   You should see something like `git version 2.44.0`.

## 3. Installing Visual Studio Code

Visual Studio Code (VS Code) is a free code editor.

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/).
2. Download and run the installer for your operating system.
3. Open VS Code once installation finishes to confirm it launches.

## 4. Recommended VS Code Extensions

Open VS Code, click the **Extensions icon** in the left sidebar (it looks like four squares), and install:

- **Python** (by Microsoft) - enables Python syntax highlighting, running, and debugging.
- **Pylance** (by Microsoft) - usually installs automatically with the Python extension; provides smarter code suggestions.

## 5. Opening the Project

1. If you have the project as a `.zip` file, extract it to a folder on your computer (e.g., your Desktop).
2. If you're cloning from GitHub instead:
   ```bash
   git clone <this-repository-url>
   ```
3. Open VS Code.
4. Go to **File -> Open Folder...** and select the project folder.

## 6. Creating a Virtual Environment

A virtual environment is an isolated space for this project's Python packages, so they don't interfere with other projects.

1. In VS Code, open a terminal: **Terminal -> New Terminal**.
2. Make sure you're inside the project folder (the terminal usually opens there automatically).
3. Run:
   - **Windows:**
     ```bash
     python -m venv venv
     ```
   - **macOS:**
     ```bash
     python3 -m venv venv
     ```
4. This creates a new folder called `venv` inside your project - this is your virtual environment.

## 7. Activating the Virtual Environment

You must "activate" the virtual environment every time you want to work on the project in a new terminal window.

- **Windows (Command Prompt):**
  ```bash
  venv\Scripts\activate.bat
  ```
- **Windows (PowerShell):**
  ```bash
  venv\Scripts\Activate.ps1
  ```
  > If PowerShell blocks this with an execution-policy error, run `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned` once, then try again.
- **macOS/Linux:**
  ```bash
  source venv/bin/activate
  ```

When active, you'll see `(venv)` at the start of your terminal prompt.

## 8. Installing Dependencies

With the virtual environment activated, install the one required package:

```bash
pip install customtkinter
```

Wait for it to finish - you'll see a "Successfully installed" message.

## 9. Creating the .env File

This project does **not** currently use any API keys, secrets, or a `.env` file - it works fully offline. You can skip this step. If a future version adds features requiring a `.env` file, this section will explain how to create one from a provided `.env.example` template.

## 10. Running the Application

With your virtual environment still activated, run:

```bash
python "Password_Gen.py"
```

(On macOS, use `python3` if `python` isn't recognized.)

A dark window titled **"Password Generator"** should appear.

Alternatively, once initial setup (steps 1-8) is complete, you can just double-click:
- `Start App.bat` on Windows
- `Start App (Mac).command` on macOS

## 11. Testing the Application

1. Launch the app using one of the methods above.
2. Confirm the window opens without errors.
3. Move the length slider and confirm the "Password Length" label updates.
4. Click **Generate** and confirm a random password appears in the display box.
5. Click **Copy** and confirm the button briefly changes to "Copied! ✅".
6. Paste (Ctrl+V / Cmd+V) into a text editor to confirm the password was copied correctly.

## 12. Using Every Feature

| Feature | How to Use |
|---|---|
| **Password Length slider** | Drag left/right to set a password length between 6 and 24 characters. |
| **Include Letters checkbox** | When checked, generated passwords may include a-z and A-Z. |
| **Include Numbers checkbox** | When checked, generated passwords may include 0-9. |
| **Include Symbols checkbox** | When checked, generated passwords may include punctuation like `!@#$`. |
| **Generate button** | Creates a new random password using the selected options. |
| **Copy button** | Copies the currently displayed password to your clipboard. |

> If you uncheck all three boxes and click Generate, the display will show "Select options!" - check at least one box and try again.

## 13. Troubleshooting

**Problem: `python` is not recognized as a command.**
Reinstall Python and make sure "Add python.exe to PATH" is checked (Windows), or use `python3` instead (macOS).

**Problem: `ModuleNotFoundError: No module named 'customtkinter'`.**
Your virtual environment isn't activated, or the package isn't installed. Re-run steps 7 and 8.

**Problem: The window doesn't appear at all / script exits immediately.**
Run the app from a terminal (not by double-clicking the `.py` file) so you can see any error messages printed.

**Problem: `Set-ExecutionPolicy` errors on Windows PowerShell.**
Use Command Prompt instead, or run the execution-policy command described in step 7.

**Problem: Nothing happens when I click "Copy".**
This is expected if the display currently shows "Select options!" or "Error occurred" - generate a valid password first.

## 14. FAQ

**Q: Do I need an internet connection to use this app?**
A: No, the app runs entirely offline.

**Q: Is this safe to use for real account passwords?**
A: See [Security Recommendations](#16-security-recommendations) below - there is an important caveat.

**Q: Can I change the window size?**
A: The window is currently fixed at 420×540 pixels and not resizable by default.

**Q: Where are generated passwords stored?**
A: Nowhere. Passwords only exist in memory while the app is open and are not saved to disk.

## 15. Common Mistakes

- Forgetting to activate the virtual environment before installing packages or running the app.
- Running `pip install` in the wrong terminal (outside the activated `venv`).
- Double-clicking the `.py` file directly instead of running it through a terminal or the provided startup script.
- Not checking "Add python.exe to PATH" during Python installation on Windows.
- Assuming the generated passwords are cryptographically secure (see below).

## 16. Security Recommendations

- This app currently uses Python's `random` module for password generation. `random` is **not cryptographically secure** and should not be relied on for high-security passwords. A future improvement would switch to Python's `secrets` module.
- Never share generated passwords over unencrypted channels (e.g., plain email or chat).
- Avoid reusing the same password across multiple accounts, even if it was randomly generated.
- Consider pairing this tool with a reputable password manager for storage.

## 17. Next Learning Steps

- Learn Python basics: [https://docs.python.org/3/tutorial/](https://docs.python.org/3/tutorial/)
- Learn more about Tkinter/CustomTkinter GUIs: [https://github.com/TomSchimansky/CustomTkinter](https://github.com/TomSchimansky/CustomTkinter)
- Learn Git basics: [https://git-scm.com/book/en/v2](https://git-scm.com/book/en/v2)
- Learn about Python's `secrets` module for secure random generation: [https://docs.python.org/3/library/secrets.html](https://docs.python.org/3/library/secrets.html)
