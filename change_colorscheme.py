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
print(colors_file)

colorscheme = sys.argv[1].strip()

def get_colorscheme() -> str:
    colorscheme: str = sys.argv[1].strip()
    # Update aliases
    if colorscheme in ["gruvbox", "g", "gruv"]:
        colorscheme = "gruvbox-material"
    if colorscheme in ["kanagawa", "kg", "k"]:
        colorscheme = "kanagawa"

    return colorscheme


def read_file(path: str) -> str:
    with open(path, "r") as f:
        return f.read()

def update_colorscheme(file: str, colorscheme: str):
    return re.sub(r"^vim.cmd\[\[colorscheme .*\]\]\) *$", f"vim.cmd([[colorscheme {colorscheme}]])", file, flags=re.MULTILINE)

def main():
    colorscheme = get_colorscheme()
    file_buffer: str = read_file(colors_file)
    new_buffer: str = update_colorscheme(file_buffer, colorscheme)
    print(new_buffer)


if __name__ == "__main__":
    main()

