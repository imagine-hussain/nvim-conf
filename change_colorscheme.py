"""
Keep this in the root of nvim config';
Otherwise, manually  configure the path to your nvim
config
"""

import os
import re
import sys

config_root: str = os.path.dirname(os.path.abspath(__file__))
colors_file = os.path.join(config_root, "lua", "configs", "colors.lua")

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

    # Update aliases
    if colorscheme in ["gruvbox", "g", "gruv"]:
        colorscheme = "gruvbox-material"
    elif colorscheme in ["kanagawa", "kg", "k"]:
        colorscheme = "kanagawa"

    else:
        # Remove this to allow any colorscheme
        print(f"""
    Only allowing supported colorschemes;
    To change this, edit {__file__} lines 33-35 or,
    provide a supported colorscheme

    You provided: {colorscheme}
    """)
        sys.exit(1)

    print("Changing colorscheme to", colorscheme)
    return colorscheme


def exit_no_colorscheme():
    print("No colorscheme provided")
    print("Correct usage: python3 change_colorscheme.py <colorscheme>")
    sys.exit(1)

def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()

def write_file(path: str, content: str):
    with open(path, "w") as f:
        f.write(content)

def update_colorscheme(file: str, colorscheme: str):
    r: str = re.sub(r"^vim.cmd\[\[colorscheme .*\]\]\) *$", f"vim.cmd([[colorscheme {colorscheme}]])", file, flags=re.MULTILINE)
    if r == file:
        print("No changes made")
    return r

def main():
    colorscheme = get_colorscheme()
    file_buffer: str = read_file(colors_file)
    new_buffer: str = update_colorscheme(file_buffer, colorscheme)
    write_file(colors_file, new_buffer)


if __name__ == "__main__":
    main()

