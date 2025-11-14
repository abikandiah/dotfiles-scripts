#!/bin/bash

# --- Script to create symbolic links in the ~/bin folder ---

# 1. Define the target directory where the links will be created
BIN_DIR="$HOME/bin"

# 2. Check if the ~/bin directory exists and create it if not
if [ ! -d "$BIN_DIR" ]; then
    echo "Creating $BIN_DIR..."
    mkdir -p "$BIN_DIR"
fi

# 3. Change directory to the repository root (where this script is located)
# This assumes the script is run from or near the repo root
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

echo "Creating symlinks from $SCRIPT_DIR to $BIN_DIR..."

# 4. Loop through every file in the current directory (the repo)
# and create a symlink in ~/bin, skipping the setup script itself and git files.
for item in *; do
    # Check if the item is a regular, executable file, and not the setup script or .git directory
    if [ -f "$item" ] && [ -x "$item" ] && [ "$item" != "setup_links.sh" ] && [ "$item" != ".git" ] && [ "$item" != ".gitignore" ]; then
        # -s: create a symbolic link
        # -f: force the creation (overwrite existing links if necessary)
        ln -sf "$SCRIPT_DIR/$item" "$BIN_DIR/"
        echo "  -> Linked: $item"
    fi
done

echo "Setup complete. You may need to run 'source ~/.bashrc' or restart your terminal."
