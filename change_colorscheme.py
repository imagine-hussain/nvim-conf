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

with open(colors_file, "w") as f:
    for line in f:
        if re.match(r"vim.cmd\(colorscheme .*\)", line):
            line = f"vim.cmd(colorscheme {colorscheme})"
            print(line)


