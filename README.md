# Personal Dotfiles

Personal dotfiles managed with GNU Stow for consistent development environment across machines.

## Quick Setup

```bash
# Install GNU Stow
brew install stow

# Install fd for faster directory searches
brew install fd

# Clone and setup
git clone <your-repo> ~/dotfiles
cd ~/dotfiles

# Stow configurations
stow kitty
stow nvim
```

## Package Management

| Command                       | Description                            |
| ----------------------------- | -------------------------------------- |
| `stow package_name`           | Stow a package                         |
| `stow -D package_name`        | Unstow a package                       |
| `stow -nv package_name`       | Preview what would be stowed (dry run) |
| `stow -D kitty && stow kitty` | Re-stow after adding new files         |

## Git Workflow

| Command                                            | Description                   |
| -------------------------------------------------- | ----------------------------- |
| `git status`                                       | Check what files have changed |
| `git add .`                                        | Add all files to staging      |
| `git add filename.txt`                             | Add specific file             |
| `git add *.conf`                                   | Add files matching pattern    |
| `git commit -m "message"`                          | Make a commit                 |
| `git push`                                         | Push to remote                |
| `git add . && git commit -m "message" && git push` | Do it all in one go           |

## Neovim Configuration

### Telescope Keymaps

| Keymap        | Function      | Description                         |
| ------------- | ------------- | ----------------------------------- |
| `<leader>pf`  | `find_files`  | Find files in current directory     |
| `<leader>ph`  | Custom        | Find files (including hidden)       |
| `<leader>pd`  | Custom        | Find directories only               |
| `<leader>pD`  | Custom        | Find directories (including hidden) |
| `<leader>C-p` | `git_files`   | Find git tracked files              |
| `<leader>ps`  | `grep_string` | Search for input string             |
| `<leader>ep`  | Custom        | Search plugin files                 |
| `<leader>fg`  | Custom        | Live grep with file filtering       |

### Telescope Examples

```lua
-- Basic file search
<leader>pf
-- Type: config.lua

-- Find hidden files (.env, .gitignore, etc.)
<leader>ph
-- Type: .env

-- Find directories only
<leader>pd
-- Type: src

-- Find hidden directories (.git, .config, etc.)
<leader>pD
-- Type: .git

-- Git files only
<leader>C-p
-- Type: telescope

-- Search for specific text
<leader>ps
-- Input: "function"

-- Search plugin source code
<leader>ep
-- Type: telescope.builtin

-- Multi-grep with file filtering
<leader>fg
-- Type: config  *.lua
-- Type: function  *.tsx
-- Type: TODO  **/src/**
```

### Multi-Grep Usage

The custom multi-grep picker (`<leader>fg`) supports advanced filtering:

- **Basic search**: `function` - finds all occurrences
- **File filtering**: `search_term  *.extension` - filter by file type
- **Directory filtering**: `search_term  **/directory/**` - filter by path
- **Quick fix**: Press `<C-q>` to send results to quickfix list

#### Examples:

```
app  *.tsx          # Find "app" in TypeScript React files
config  *.lua       # Find "config" in Lua files
TODO  **/src/**     # Find "TODO" in src directories
function  *.{js,ts} # Find "function" in JS/TS files
```

### Harpoon Navigation

| Keymap      | Function               | Description                  |
| ----------- | ---------------------- | ---------------------------- |
| `<leader>a` | `mark.add_file`        | Add current file to harpoon  |
| `<C-e>`     | `ui.toggle_quick_menu` | Toggle harpoon quick menu    |
| `<C-h>`     | `ui.nav_file(1)`       | Navigate to harpooned file 1 |
| `<C-t>`     | `ui.nav_file(2)`       | Navigate to harpooned file 2 |
| `<C-n>`     | `ui.nav_file(3)`       | Navigate to harpooned file 3 |
| `<C-s>`     | `ui.nav_file(4)`       | Navigate to harpooned file 4 |

#### Harpoon Workflow:

1. **Add files to Harpoon**

   - Open a file you want to bookmark
   - Press `<leader>a` (space + a) to add it to harpoon
   - Repeat for other important files (up to 4 with your config)

2. **View your harpooned files**

   - Press `<C-e>` (Ctrl + e) to open the harpoon quick menu
   - You'll see a list of your bookmarked files

3. **Navigate between files instantly**
   - `<C-h>` - Jump to file #1
   - `<C-t>` - Jump to file #2
   - `<C-n>` - Jump to file #3
   - `<C-s>` - Jump to file #4

## Neovim Window & Navigation Controls

### Window Navigation

| Command  | Action                    |
| -------- | ------------------------- |
| `<C-w>h` | Move to left window       |
| `<C-w>l` | Move to right window      |
| `<C-w>j` | Move to window below      |
| `<C-w>k` | Move to window above      |
| `<C-w>w` | Cycle through all windows |
| `<C-w>W` | Cycle windows in reverse  |
| `<C-w>o` | Close all other windows   |

### Plugin-Specific Controls

| Plugin   | Keymap            | Function      | Description                 |
| -------- | ----------------- | ------------- | --------------------------- |
| UndoTree | `q`               | Close         | Close UndoTree window       |
| UndoTree | `:UndotreeToggle` | Toggle        | Open/close UndoTree         |
| UndoTree | `:UndotreeHide`   | Force close   | Always close UndoTree       |
| UndoTree | `j/k`             | Navigate      | Move through undo history   |
| UndoTree | `Enter`           | Preview/Apply | Preview or apply undo state |

### General Neovim Controls

| Keymap | Function       | Description              |
| ------ | -------------- | ------------------------ |
| `q`    | Quit window    | Close most popup windows |
| `:q`   | Quit           | Close current window     |
| `:qa`  | Quit all       | Close all windows        |
| `:w`   | Write          | Save current file        |
| `:wq`  | Write and quit | Save and close           |

## Daily Sync

```bash
# Update configs from remote and re-stow
cd ~/dotfiles && git pull && stow kitty && stow nvim
```

## Quick Access

```bash
# Edit dotfiles with telescope
cd ~/dotfiles && nvim .
# Then use <leader>ph to find hidden files like .gitignore
```
