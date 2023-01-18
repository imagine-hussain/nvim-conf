"""
Keep this in the root of nvim config';
Otherwise, manually  configure the path to your nvim
config as `CONFIG_ROOT`

Ensure `COLORS_FILE` is correct path

Usage:
    python3 recolor.py <colorscheme>

"""

import os
import re
import sys
import json

CONFIG_ROOT: str = os.path.dirname(os.path.abspath(__file__))
COLORS_FILE = os.path.join(CONFIG_ROOT, "lua", "configs", "colors.lua")

print("Root: ", CONFIG_ROOT)
print("Root: ", COLORS_FILE)

# Key: colorscheme, Value: aliases
ALIASES: dict[str, list[str]] = {
    "default": ["default", "d", "def"],
    "gruvbox-material": ["gruvbox", "g", "gruv", "gruvbox-material"],
    "kanagawa": ["kanagawa", "kg", "k"],
    "github": ["github", "gh"],
    "substrata": ["substrata", "sub"],
    "salvation": ["salvation", "salv"],
    "tokyonight": ["tokyonight", "tokyo", "tn"],
    "tokyonight-moon": ["tokyonight-moon", "tn-moon"],
    "iceberg": ["iceberg", "ice"],
    "monokai-pro": ["monokai-pro", "monokai"],
    "sonokai": ["sonokai"],
    "nord": ["nord"],
    "ayu": ["ayu"],
}

def main():
    colorscheme: str = get_colorscheme()
    file_buffer: str = read_file(COLORS_FILE)
    new_buffer: str = update_colorscheme(file_buffer, colorscheme)
    write_file(COLORS_FILE, new_buffer)

def get_colorscheme() -> str:
    try:
        colorscheme: str = sys.argv[1].strip()
    except IndexError:
        exit_no_colorscheme()
    except Exception as e:
        print(e)
        exit_no_colorscheme()

    if not colorscheme:
        exit_no_colorscheme()

    # this should really be part of a command parser instead
    if colorscheme == "list":
        print_aliases()
        exit(0)

    # Update aliases
    post_alias_colorscheme: str | None = process_aliases(colorscheme)

    # Remove this statement to verifying colorschemes (Not Recommended)
    if post_alias_colorscheme is None:
        exit_invalid_colorscheme(colorscheme)

    final_colorscheme: str = post_alias_colorscheme or colorscheme
    print(f"Found colorscheme: {final_colorscheme}")
    return final_colorscheme

def update_colorscheme(file: str, colorscheme: str):
    return re.sub(
        r"^[ ]*vim.cmd\(\[\[colorscheme.*\]\]\)$", # find current colorscheme
        f"vim.cmd([[colorscheme {colorscheme}]])", # replace with given colorscheme
        file,
        flags=re.MULTILINE
    )

def process_aliases(source: str):
    for colorscheme, aliases in ALIASES.items():
        if source in [colorscheme, *aliases]:
            return colorscheme

def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()

def write_file(path: str, content: str):
    with open(path, "w") as f:
        f.write(content)

def exit_no_colorscheme():
    print("No colorscheme provided")
    print("Correct usage: python3 recolor.py <colorscheme>")
    sys.exit(1)

def exit_invalid_colorscheme(colorscheme: str):
    print(f"""
    Only allowing supported colorschemes;
    To change this, edit {__file__} inside ~line 50 or,
    provide a supported colorscheme

    You provided: {colorscheme}
    """)
    sys.exit(1)

def print_aliases():
    print("Aliases List:")
    align_col: int = max(len(k) for k in ALIASES.keys())
    for colorscheme, aliases in ALIASES.items():
        alignment_buffer = " " * (align_col - len(colorscheme) + 4 )
        print(f"{colorscheme}:{alignment_buffer}{', '.join(aliases)}")

if __name__ == "__main__":
    main()

