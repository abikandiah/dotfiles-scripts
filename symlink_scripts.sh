# Change into the scripts directory
cd ~/Projects/dotfiles-scripts

# Loop through every script and create a symlink in ~/bin
for script in *; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        ln -sf "$(pwd)/$script" ~/bin/
    fi
done

