Dotfiles
Personal dotfiles managed with GNU Stow.

# Install GNU Stow:

brew install stow

Stow configurations:

# Stow kitty configuration

stow kitty

Usage
Adding new configuration files
When you add new files to an existing package (like adding a theme to kitty):

# Unstow and re-stow to pick up the new theme file

stow -D kitty
stow kitty

Managing packages

# Stow a package

stow package_name

# Unstow a package

stow -D package_name

# Preview what would be stowed (dry run)

stow -nv package_name

# Check what files have changed

git status

# Add files to staging

git add .

# add specific file

git add filename.txt

# add files matching pattern

git add \*.conf

# Make a commit

git commit -m "your commit message"

# Push to remote

git push

# Or do it all in one go

git add . && git commit -m "your message" && git push
# MacBook setup complete
