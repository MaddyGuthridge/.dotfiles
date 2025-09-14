#!/usr/bin/python3
"""
Simple script to make Obsidian.md open with the vault picker rather than the
most recent vault, since it doesn't seem to do that by default
"""
import os
import json
from typing import Any
from subprocess import Popen

HOME = os.getenv('HOME')

# This is the directory for a Flatpak installation on Linux
# it will be different for other kinds of installations and operating systems
CONFIG_FILE = f"{HOME}/.var/app/md.obsidian.Obsidian/config/obsidian/obsidian.json"

# This is the command used to run Obsidian for a Flatpak installation on Linux
# once again, it changes per-platform
OBSIDIAN_COMMAND = [
    "/usr/bin/flatpak",
    "run",
    "md.obsidian.Obsidian",
]


# Now open the file
file = json.load(open(CONFIG_FILE))

vaults: dict[str, dict[str, Any]] = file["vaults"]
# Data has structure
# {
#   "vaults": {
#     "bf402274f8bd19c2": {
#       "path": "/path/to/vault",
#       "ts": 1682914848466,
#       "open" true      <-- we want to remove this
#     }
#   }
# }

# Find the open vault and remove it
for vault in vaults.values():
    vault.pop("open", None)

# Save the config file again
json.dump(file, open(CONFIG_FILE, "w"))

# Now launch Obsidian
process = Popen(OBSIDIAN_COMMAND, start_new_session=True)
