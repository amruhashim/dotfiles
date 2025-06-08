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

### LSP Keymaps

| Keymap           | Function                       | Description                  |
| ---------------- | ------------------------------ | ---------------------------- |
| `gd`             | `vim.lsp.buf.definition`       | Go to definition             |
| `K`              | `vim.lsp.buf.hover`            | Show documentation hover     |
| `<leader>vws`    | `vim.lsp.buf.workspace_symbol` | Search workspace symbols     |
| `<leader>vd`     | `vim.diagnostic.open_float`    | Show diagnostic details      |
| `[d`             | `vim.diagnostic.goto_next`     | Go to next diagnostic        |
| `]d`             | `vim.diagnostic.goto_prev`     | Go to previous diagnostic    |
| `<leader>vca`    | `vim.lsp.buf.code_action`      | Show code actions            |
| `<leader>vrr`    | `vim.lsp.buf.references`       | Find references              |
| `<leader>vrn`    | `vim.lsp.buf.rename`           | Rename symbol                |
| `<C-h>` (insert) | `vim.lsp.buf.signature_help`   | Show function signature help |

### LSP Completion

| Keymap      | Function            | Description                 |
| ----------- | ------------------- | --------------------------- |
| `<C-p>`     | Previous completion | Navigate up in completion   |
| `<C-n>`     | Next completion     | Navigate down in completion |
| `<C-y>`     | Confirm completion  | Accept selected completion  |
| `<C-Space>` | Trigger completion  | Manually trigger completion |

### Core Keymaps

| Keymap             | Function     | Description                |
| ------------------ | ------------ | -------------------------- |
| `<leader>`         | Space        | Leader key set to spacebar |
| `<leader>pv`       | `vim.cmd.Ex` | Open file explorer (netrw) |
| `<leader><leader>` | Source file  | Reload current Lua file    |

### Movement & Navigation

| Keymap  | Function                  | Description                           |
| ------- | ------------------------- | ------------------------------------- |
| `J`     | Join lines (cursor stays) | Join line below, keep cursor position |
| `<C-d>` | Half page down + center   | Scroll down and center cursor         |
| `<C-u>` | Half page up + center     | Scroll up and center cursor           |
| `n`     | Next search + center      | Next search result, center screen     |
| `N`     | Previous search + center  | Previous search result, center screen |
| `=ap`   | Format paragraph          | Auto-format current paragraph         |

### Visual Mode Line Movement

| Keymap | Function       | Description              |
| ------ | -------------- | ------------------------ |
| `J`    | Move line down | Move selected lines down |
| `K`    | Move line up   | Move selected lines up   |

### Copy/Paste/Delete (System Clipboard)

| Keymap      | Mode          | Function            | Description                         |
| ----------- | ------------- | ------------------- | ----------------------------------- |
| `<leader>p` | Visual        | Paste without yank  | Paste over selection, keep register |
| `<leader>y` | Normal/Visual | Yank to system      | Copy to system clipboard            |
| `<leader>Y` | Normal        | Yank line to system | Copy whole line to system clipboard |
| `<leader>d` | Normal/Visual | Delete to void      | Delete without affecting registers  |

### Error Handling & Go Snippets

| Keymap       | Function          | Description                            |
| ------------ | ----------------- | -------------------------------------- |
| `<leader>ee` | Basic error check | `if err != nil { return err }`         |
| `<leader>ea` | Assert no error   | `assert.NoError(err, "")`              |
| `<leader>ef` | Fatal error log   | `log.Fatalf("error: %s\n", err)`       |
| `<leader>el` | Logger error      | `.logger.Error("error", "error", err)` |

### Quickfix & Location List

| Keymap      | Function          | Description                          |
| ----------- | ----------------- | ------------------------------------ |
| `<C-k>`     | Next quickfix     | Go to next item in quickfix          |
| `<C-j>`     | Previous quickfix | Go to previous item in quickfix      |
| `<leader>k` | Next location     | Go to next item in location list     |
| `<leader>j` | Previous location | Go to previous item in location list |

### Utility & Productivity

| Keymap        | Function             | Description                        |
| ------------- | -------------------- | ---------------------------------- |
| `<leader>s`   | Search and replace   | Replace word under cursor globally |
| `<leader>x`   | Make executable      | Add execute permissions to file    |
| `<leader>f`   | Format with conform  | Format current buffer              |
| `<leader>zig` | Restart LSP          | Restart language server            |
| `<C-c>`       | Escape (insert mode) | Alternative to Escape key          |
| `Q`           | Disabled             | Disable Ex mode                    |

### Testing & Development

| Keymap       | Function           | Description                      |
| ------------ | ------------------ | -------------------------------- |
| `<leader>tf` | Test file          | Run Plenary test on current file |
| `<leader>ca` | Cellular automaton | Fun animation (make it rain)     |

### Tmux Integration

| Keymap  | Function         | Description              |
| ------- | ---------------- | ------------------------ |
| `<C-f>` | Tmux sessionizer | Open tmux session picker |

### Vim-with-me (Collaboration)

| Keymap         | Function          | Description                 |
| -------------- | ----------------- | --------------------------- |
| `<leader>vwm`  | Start vim-with-me | Start collaboration session |
| `<leader>svwm` | Stop vim-with-me  | Stop collaboration session  |

### Git (Fugitive)

| Keymap       | Function      | Description            |
| ------------ | ------------- | ---------------------- |
| `<leader>gs` | `vim.cmd.Git` | Open Git status window |

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

## Neovim Window & Split Management

### Creating Splits

| Command            | Function                   | Description                            |
| ------------------ | -------------------------- | -------------------------------------- |
| `:split` or `:sp`  | Horizontal split           | Split current file horizontally        |
| `:vsplit` or `:vs` | Vertical split             | Split current file vertically          |
| `:split filename`  | Horizontal split with file | Split horizontally and open file       |
| `:vsplit filename` | Vertical split with file   | Split vertically and open file         |
| `:new`             | New horizontal split       | New horizontal split with empty buffer |
| `:vnew`            | New vertical split         | New vertical split with empty buffer   |

### Split Navigation

| Command  | Action                    |
| -------- | ------------------------- |
| `<C-w>h` | Move to left window       |
| `<C-w>l` | Move to right window      |
| `<C-w>j` | Move to window below      |
| `<C-w>k` | Move to window above      |
| `<C-w>w` | Cycle through all windows |
| `<C-w>W` | Cycle windows in reverse  |

### Split Resizing

| Command   | Action                        |
| --------- | ----------------------------- |
| `<C-w>=`  | Make all splits equal size    |
| `<C-w>_`  | Maximize current split height |
| `<C-w>\|` | Maximize current split width  |
| `<C-w>+`  | Increase height               |
| `<C-w>-`  | Decrease height               |
| `<C-w>>`  | Increase width                |
| `<C-w><`  | Decrease width                |

### Split Management

| Command  | Action                  |
| -------- | ----------------------- |
| `<C-w>q` | Close current split     |
| `<C-w>o` | Close all other windows |
| `<C-w>c` | Close current window    |

#### Split Usage Examples

**Edit two files side by side:**

```bash
:vs config.lua         # Split vertically and open config.lua
<C-w>l                 # Move to right split
:e another-file.js     # Open different file in right split
<C-w>h                 # Move back to left split
```

**Compare files:**

```bash
:vs file1.js           # Open file1 in vertical split
<C-w>l                 # Move to right split
:e file2.js            # Open file2 in right split
# Now you can see both files side by side
```

**Multiple horizontal views:**

```bash
:sp                    # Horizontal split with same file
:sp logs.txt           # Another horizontal split with logs
# Now you have 3 horizontal panes stacked
```

**Quick workflow:**

```bash
# Working on main file
:vs                    # Quick vertical split
<C-w>l                 # Move to new split
<leader>pf             # Use telescope to open another file
<C-w>h                 # Jump back to main file
```

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
