import customtkinter as ctk
import random
import string

# App appearance
ctk.set_appearance_mode("dark")
ctk.set_default_color_theme("blue")

# Main window
app = ctk.CTk()
app.title("Password Generator")
app.geometry("420x540")
app.resizable(False, False)

def generate_password():
    try:
        length = int(length_slider.get())
        
        characters = ""
        if cb_letters.get():
            characters += string.ascii_letters
        if cb_numbers.get():
            characters += string.digits
        if cb_symbols.get():
            characters += string.punctuation

        if not characters:
            result_display.configure(text="Select options!")
            return

        password = "".join(random.choice(characters) for _ in range(length))
        result_display.configure(text=password)
    except Exception:
        result_display.configure(text="Error occurred")

def copy_to_clipboard():
    password = result_display.cget("text")
    if password and password not in ["Select options!", "Error occurred", "000000"]:
        app.clipboard_clear()
        app.clipboard_append(password)
        btn_copy.configure(text="Copied! ✅")
        app.after(1500, lambda: btn_copy.configure(text="Copy to Clipboard"))

def slider_event(value):
    lbl_length.configure(text=f"Password Length: {int(value)}")

# Title
title_label = ctk.CTkLabel(app, text="Secure Pass Gen", height=60, font=("Arial", 28, "bold"))
title_label.pack(fill="x", padx=20, pady=(20, 5))

# Display Box (Matches your calculator style)
result_display = ctk.CTkLabel(
    app, text="000000", height=80, font=("Arial", 24, "bold"),
    fg_color="#1e1e1e", corner_radius=12, text_color="#1f6aa5"
)
result_display.pack(fill="x", padx=20, pady=10)

# Settings Frame
settings_frame = ctk.CTkFrame(app)
settings_frame.pack(fill="both", expand=True, padx=20, pady=10)

lbl_length = ctk.CTkLabel(settings_frame, text="Password Length: 12", font=("Arial", 16))
lbl_length.pack(pady=(10, 0))

length_slider = ctk.CTkSlider(settings_frame, from_=6, to=24, number_of_steps=26, command=slider_event)
length_slider.set(12)
length_slider.pack(fill="x", padx=20, pady=10)

cb_letters = ctk.CTkCheckBox(settings_frame, text="Include Letters (a-Z)", font=("Arial", 14))
cb_letters.select()
cb_letters.pack(anchor="w", padx=30, pady=5)

cb_numbers = ctk.CTkCheckBox(settings_frame, text="Include Numbers (0-9)", font=("Arial", 14))
cb_numbers.select()
cb_numbers.pack(anchor="w", padx=30, pady=5)

cb_symbols = ctk.CTkCheckBox(settings_frame, text="Include Symbols (!@#$)", font=("Arial", 14))
cb_symbols.select()
cb_symbols.pack(anchor="w", padx=30, pady=5)

# Action Frame
btn_frame = ctk.CTkFrame(app, fg_color="transparent")
btn_frame.pack(fill="x", padx=20, pady=(5, 20))
btn_frame.columnconfigure(0, weight=2)
btn_frame.columnconfigure(1, weight=1)

btn_gen = ctk.CTkButton(btn_frame, text="Generate", font=("Arial", 16, "bold"), height=55, corner_radius=12, command=generate_password)
btn_gen.grid(row=0, column=0, padx=(0, 5), sticky="nsew")

btn_copy = ctk.CTkButton(btn_frame, text="Copy", font=("Arial", 14), height=55, corner_radius=12, fg_color="#555555", hover_color="#333333", command=copy_to_clipboard)
btn_copy.grid(row=0, column=1, padx=(5, 0), sticky="nsew")

app.mainloop()
