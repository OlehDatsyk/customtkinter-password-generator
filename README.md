# Secure Pass Gen 🔐

A simple, dark-themed desktop password generator built with Python and [CustomTkinter](https://github.com/TomSchimansky/CustomTkinter).

Generate random passwords of a configurable length, choosing whether to include letters, numbers, and symbols - then copy the result to your clipboard with a single click.

---

## ✨ Features

- Adjustable password length (6-24 characters) via slider
- Toggle letters (a-Z), numbers (0-9), and symbols (`!@#$...`) on or off
- One-click "Copy to Clipboard" button with visual confirmation
- Clean, dark-mode desktop UI

## 📸 Preview

A dark 420×540 window containing a password display box, a length slider, three checkboxes, and Generate/Copy buttons.

## 🧰 Requirements

- Python 3.8+
- [customtkinter](https://pypi.org/project/customtkinter/)

## 📦 Installation

```bash
git clone <this-repository-url>
cd <repository-folder>
pip install customtkinter
```

> New to Python, Git, or the terminal? See [INSTRUCTION.md](./INSTRUCTION.md) for a complete beginner-friendly walkthrough.

## ▶️ Usage

```bash
python "Password_Gen.py"
```

Or, on Windows/macOS, double-click the provided startup script:

- **Windows:** `Start App.bat`
- **macOS:** `Start App (Mac).command`

1. Adjust the **Password Length** slider.
2. Check/uncheck **Letters**, **Numbers**, and **Symbols** as desired.
3. Click **Generate** to create a password.
4. Click **Copy** to copy it to your clipboard.

## 🗂 Project Structure

```
.
└── Password_Gen.py # Main application (GUI + password logic)
```

## ⚠️ Security Note

This generator currently uses Python's built-in `random` module, which is **not cryptographically secure**. For generating passwords intended to protect real accounts, consider using the `secrets` module instead. See `PROJECT_REVIEW.md` for details and a recommended fix.

## 🤝 Contributing

Issues and pull requests are welcome. Please open an issue first to discuss any significant changes.

## 📄 License

No license file is currently included in this repository. See `PROJECT_REVIEW.md` for a recommendation on choosing and adding one.
