# Personal Dotfiles

Personal dotfiles managed with GNU Stow for consistent development environment across machines.

## 🚀 Quick Setup

```bash
# Install dependencies
brew install stow fd gh

# Clone and setup
git clone <your-repo> ~/dotfiles
cd ~/dotfiles

# Stow configurations
stow kitty
stow nvim
```

## 📦 Package Management

| Command                       | Description                            |
| ----------------------------- | -------------------------------------- |
| `stow package_name`           | Stow a package                         |
| `stow -D package_name`        | Unstow a package                       |
| `stow -nv package_name`       | Preview what would be stowed (dry run) |
| `stow -D kitty && stow kitty` | Re-stow after adding new files         |

## 🔄 Git Workflow

| Command                                            | Description                   |
| -------------------------------------------------- | ----------------------------- |
| `git status`                                       | Check what files have changed |
| `git add .`                                        | Add all files to staging      |
| `git add filename.txt`                             | Add specific file             |
| `git add *.conf`                                   | Add files matching pattern    |
| `git commit -m "message"`                          | Make a commit                 |
| `git push`                                         | Push to remote                |
| `git add . && git commit -m "message" && git push` | Do it all in one go           |

### Creating GitHub Repository from Neovim

**Method 1: Using Built-in Terminal**

```vim
:terminal
```

Then in terminal:

```bash
# Initialize and setup
git init
git add .
git commit -m "Initial commit"

# Create GitHub repo (requires GitHub CLI)
gh repo create your-repo-name --public --source=. --remote=origin --push

# Or manually add remote
git remote add origin https://github.com/yourusername/your-repo-name.git
git branch -M main
git push -u origin main
```

**Method 2: Using vim-fugitive Commands**

```vim
:!git init
:!git add .
:!git commit -m "Initial commit"
:!git remote add origin https://github.com/yourusername/repo-name.git
:!git push -u origin main
```

**Method 3: Using `<leader>gs` Workflow**

1. Initialize repo: `:!git init`
2. Press `<leader>gs` to open Git status
3. Stage files with `s`
4. Press `cc` to commit
5. Add remote and push: `:!git remote add origin <url> && git push -u origin main`

---

## ⚙️ Neovim Configuration

### 🔧 LSP Keymaps

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

### 📝 LSP Completion

| Keymap      | Function            | Description                 |
| ----------- | ------------------- | --------------------------- |
| `<C-p>`     | Previous completion | Navigate up in completion   |
| `<C-n>`     | Next completion     | Navigate down in completion |
| `<C-y>`     | Confirm completion  | Accept selected completion  |
| `<C-Space>` | Trigger completion  | Manually trigger completion |

**💡 How to Use LSP Suggestions:**

1. Start typing (completion menu appears automatically)
2. Use `<C-n>` and `<C-p>` to navigate through suggestions
3. Press `<C-y>` to select and insert the highlighted item

**Example workflow:**

```
Type: "conso"
↓ (completion menu appears)
Use <C-n> to highlight "console.log"
Press <C-y> to select it
```

### 🎯 Core Keymaps

| Keymap             | Function     | Description                |
| ------------------ | ------------ | -------------------------- |
| `<leader>`         | Space        | Leader key set to spacebar |
| `<leader>pv`       | `vim.cmd.Ex` | Open file explorer (netrw) |
| `<leader><leader>` | Source file  | Reload current Lua file    |

### 🧭 Movement & Navigation

| Keymap  | Function                  | Description                           |
| ------- | ------------------------- | ------------------------------------- |
| `J`     | Join lines (cursor stays) | Join line below, keep cursor position |
| `<C-d>` | Half page down + center   | Scroll down and center cursor         |
| `<C-u>` | Half page up + center     | Scroll up and center cursor           |
| `n`     | Next search + center      | Next search result, center screen     |
| `N`     | Previous search + center  | Previous search result, center screen |
| `=ap`   | Format paragraph          | Auto-format current paragraph         |

### ↕️ Visual Mode Line Movement

| Keymap | Function       | Description              |
| ------ | -------------- | ------------------------ |
| `J`    | Move line down | Move selected lines down |
| `K`    | Move line up   | Move selected lines up   |

### 📋 Copy/Paste/Delete (System Clipboard)

| Keymap      | Mode          | Function            | Description                         |
| ----------- | ------------- | ------------------- | ----------------------------------- |
| `<leader>p` | Visual        | Paste without yank  | Paste over selection, keep register |
| `<leader>y` | Normal/Visual | Yank to system      | Copy to system clipboard            |
| `<leader>Y` | Normal        | Yank line to system | Copy whole line to system clipboard |
| `<leader>d` | Normal/Visual | Delete to void      | Delete without affecting registers  |

### 🚨 Error Handling & Go Snippets

| Keymap       | Function          | Description                            |
| ------------ | ----------------- | -------------------------------------- |
| `<leader>ee` | Basic error check | `if err != nil { return err }`         |
| `<leader>ea` | Assert no error   | `assert.NoError(err, "")`              |
| `<leader>ef` | Fatal error log   | `log.Fatalf("error: %s\n", err)`       |
| `<leader>el` | Logger error      | `.logger.Error("error", "error", err)` |

### 🔧 Quickfix & Location List

| Keymap      | Function          | Description                          |
| ----------- | ----------------- | ------------------------------------ |
| `<C-k>`     | Next quickfix     | Go to next item in quickfix          |
| `<C-j>`     | Previous quickfix | Go to previous item in quickfix      |
| `<leader>k` | Next location     | Go to next item in location list     |
| `<leader>j` | Previous location | Go to previous item in location list |

### 🛠️ Utility & Productivity

| Keymap        | Function             | Description                        |
| ------------- | -------------------- | ---------------------------------- |
| `<leader>s`   | Search and replace   | Replace word under cursor globally |
| `<leader>x`   | Make executable      | Add execute permissions to file    |
| `<leader>f`   | Format with conform  | Format current buffer              |
| `<leader>zig` | Restart LSP          | Restart language server            |
| `<C-c>`       | Escape (insert mode) | Alternative to Escape key          |
| `Q`           | Disabled             | Disable Ex mode                    |

### 🧪 Testing & Development

| Keymap       | Function           | Description                      |
| ------------ | ------------------ | -------------------------------- |
| `<leader>tf` | Test file          | Run Plenary test on current file |
| `<leader>ca` | Cellular automaton | Fun animation (make it rain)     |

### 🖥️ Tmux Integration

| Keymap  | Function         | Description              |
| ------- | ---------------- | ------------------------ |
| `<C-f>` | Tmux sessionizer | Open tmux session picker |

### 👥 Vim-with-me (Collaboration)

| Keymap         | Function          | Description                 |
| -------------- | ----------------- | --------------------------- |
| `<leader>vwm`  | Start vim-with-me | Start collaboration session |
| `<leader>svwm` | Stop vim-with-me  | Stop collaboration session  |

### 🌟 Git (Fugitive)

| Keymap       | Function      | Description                           |
| ------------ | ------------- | ------------------------------------- |
| `<leader>gs` | `vim.cmd.Git` | Open Git status window (vim-fugitive) |

#### Git Status Window Operations

When you press `<leader>gs`, vim-fugitive opens a powerful Git status interface:

**📁 File Operations**

- `s` - Stage file under cursor
- `u` - Unstage file under cursor
- `U` - Unstage all files
- `-` - Toggle stage/unstage for file under cursor
- `X` - Discard changes in file under cursor

**👀 Navigation & Viewing**

- `Enter` - Open file under cursor
- `o` - Open file in horizontal split
- `gO` - Open file in vertical split
- `=` - Show diff for file under cursor
- `>` - Show diff in horizontal split
- `<` - Show diff in vertical split

**💾 Commit Operations**

- `cc` - Create commit (opens commit message editor)
- `ca` - Amend last commit
- `ce` - Amend last commit without editing message
- `cw` - Reword last commit message

**🌿 Branch Operations**

- `cb` - Create and checkout new branch
- `co` - Checkout existing branch/commit

**⚡ Other Actions**

- `r` - Reload status window
- `g?` - Show help with all available commands
- `q` - Close status window

**📋 Example Workflow**

1. Press `<leader>gs` to open Git status
2. Navigate to modified file with `j/k`
3. Press `s` to stage the file
4. Press `cc` to commit
5. Type commit message and save (`:wq`)
6. Press `q` to close status window

### 🔍 Telescope Keymaps

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

**💡 Telescope Usage Examples**

```bash
# File searching
<leader>pf    # Type: config.lua
<leader>ph    # Type: .env (hidden files)
<leader>pd    # Type: src (directories only)
<leader>pD    # Type: .git (hidden directories)
<lea. Update lualine.lua
In /Users/amruhashim/dotfiles/nvim/.config/nvim/after/plugin/lualine.lua around line 489:
Replace:
luavim.lsp.get_active_clients()
With:
luavim.lsp.get_clients()der>C-p   # Type: telescope (git files only)

# Content searching
<leader>ps    # Input: "function"
<leader>ep    # Type: telescope.builtin (plugin files)
<leader>fg    # Advanced multi-grep (see below)
```

**🔎 Multi-Grep Advanced Usage**

The custom multi-grep picker (`<leader>fg`) supports powerful filtering:

```bash
# Basic patterns
function                    # Find all occurrences
search_term  *.extension   # Filter by file type
search_term  **/dir/**     # Filter by directory path

# Real examples
app  *.tsx                 # Find "app" in TypeScript React files
config  *.lua              # Find "config" in Lua files
TODO  **/src/**            # Find "TODO" in src directories
function  *.{js,ts}        # Find "function" in JS/TS files
```

**Pro tip:** Press `<C-q>` to send results to quickfix list for easy navigation.

### 🎯 Harpoon Navigation

| Keymap      | Function               | Description                  |
| ----------- | ---------------------- | ---------------------------- |
| `<leader>a` | `mark.add_file`        | Add current file to harpoon  |
| `<C-e>`     | `ui.toggle_quick_menu` | Toggle harpoon quick menu    |
| `<C-h>`     | `ui.nav_file(1)`       | Navigate to harpooned file 1 |
| `<C-t>`     | `ui.nav_file(2)`       | Navigate to harpooned file 2 |
| `<C-n>`     | `ui.nav_file(3)`       | Navigate to harpooned file 3 |
| `<C-s>`     | `ui.nav_file(4)`       | Navigate to harpooned file 4 |

**🎮 Harpoon Workflow**

1. **📌 Bookmark Important Files**

   - Open a file you frequently use
   - Press `<leader>a` (space + a) to add it to harpoon
   - Repeat for up to 4 essential files

2. **📋 View Your Bookmarks**

   - Press `<C-e>` (Ctrl + e) to see your harpooned files
   - Visual menu shows all bookmarked files

3. **⚡ Instant Navigation**
   - `<C-h>` → Jump to file #1
   - `<C-t>` → Jump to file #2
   - `<C-n>` → Jump to file #3
   - `<C-s>` → Jump to file #4

---

## 🪟 Window & Split Management

### ➕ Creating Splits

| Command            | Function                   | Description                            |
| ------------------ | -------------------------- | -------------------------------------- |
| `:split` or `:sp`  | Horizontal split           | Split current file horizontally        |
| `:vsplit` or `:vs` | Vertical split             | Split current file vertically          |
| `:split filename`  | Horizontal split with file | Split horizontally and open file       |
| `:vsplit filename` | Vertical split with file   | Split vertically and open file         |
| `:new`             | New horizontal split       | New horizontal split with empty buffer |
| `:vnew`            | New vertical split         | New vertical split with empty buffer   |

### 🧭 Split Navigation

| Command  | Action                    |
| -------- | ------------------------- |
| `<C-w>h` | Move to left window       |
| `<C-w>l` | Move to right window      |
| `<C-w>j` | Move to window below      |
| `<C-w>k` | Move to window above      |
| `<C-w>w` | Cycle through all windows |
| `<C-w>W` | Cycle windows in reverse  |

### 📏 Split Resizing

| Command   | Action                        |
| --------- | ----------------------------- |
| `<C-w>=`  | Make all splits equal size    |
| `<C-w>_`  | Maximize current split height |
| `<C-w>\|` | Maximize current split width  |
| `<C-w>+`  | Increase height               |
| `<C-w>-`  | Decrease height               |
| `<C-w>>`  | Increase width                |
| `<C-w><`  | Decrease width                |

### 🗂️ Split Management

| Command  | Action                  |
| -------- | ----------------------- |
| `<C-w>q` | Close current split     |
| `<C-w>o` | Close all other windows |
| `<C-w>c` | Close current window    |

**💼 Split Usage Examples**

```bash
# Side-by-side editing
:vs config.lua         # Split vertically, open config.lua
<C-w>l                 # Move to right split
:e another-file.js     # Open different file in right split
<C-w>h                 # Move back to left split

# File comparison
:vs file1.js           # Open file1 in vertical split
<C-w>l                 # Move to right split
:e file2.js            # Open file2 for comparison

# Multi-pane setup
:sp                    # Horizontal split with same file
:sp logs.txt           # Another horizontal split with logs
# Result: 3 horizontal panes stacked

# Quick workflow
:vs                    # Quick vertical split
<C-w>l                 # Move to new split
<leader>pf             # Use telescope to open another file
<C-w>h                 # Jump back to main file
```

### 🎛️ Window & Navigation Controls

| Command  | Action                    |
| -------- | ------------------------- |
| `<C-w>h` | Move to left window       |
| `<C-w>l` | Move to right window      |
| `<C-w>j` | Move to window below      |
| `<C-w>k` | Move to window above      |
| `<C-w>w` | Cycle through all windows |
| `<C-w>W` | Cycle windows in reverse  |
| `<C-w>o` | Close all other windows   |

### 🔌 Plugin-Specific Controls

| Plugin   | Keymap            | Function      | Description                 |
| -------- | ----------------- | ------------- | --------------------------- |
| UndoTree | `q`               | Close         | Close UndoTree window       |
| UndoTree | `:UndotreeToggle` | Toggle        | Open/close UndoTree         |
| UndoTree | `:UndotreeHide`   | Force close   | Always close UndoTree       |
| UndoTree | `j/k`             | Navigate      | Move through undo history   |
| UndoTree | `Enter`           | Preview/Apply | Preview or apply undo state |

### 📱 General Neovim Controls

| Keymap | Function       | Description              |
| ------ | -------------- | ------------------------ |
| `q`    | Quit window    | Close most popup windows |
| `:q`   | Quit           | Close current window     |
| `:qa`  | Quit all       | Close all windows        |
| `:w`   | Write          | Save current file        |
| `:wq`  | Write and quit | Save and close           |

---

## 🦋 Flutter Development

### 📲 Flutter Plugin Commands (flutter-tools.nvim)

**Basic Flutter Commands:**

| Command             | Description                                     |
| ------------------- | ----------------------------------------------- |
| `:FlutterRun`       | Run the Flutter app                             |
| `:FlutterDevices`   | List available devices                          |
| `:FlutterEmulators` | List available emulators                        |
| `:FlutterReload`    | Hot reload (save file to trigger automatically) |
| `:FlutterRestart`   | Hot restart                                     |
| `:FlutterQuit`      | Stop the running app                            |
| `:FlutterDetach`    | Detach from running app without stopping        |

**Development Commands:**

| Command                   | Description                |
| ------------------------- | -------------------------- |
| `:FlutterOutlineToggle`   | Toggle widget outline view |
| `:FlutterDevTools`        | Open Flutter DevTools      |
| `:FlutterCopyProfilerUrl` | Copy profiler URL          |
| `:FlutterLspRestart`      | Restart Dart LSP           |
| `:FlutterSuper`           | Go to super class          |
| `:FlutterReanalyze`       | Force reanalyze Dart code  |

**Project Commands:**

| Command              | Description                |
| -------------------- | -------------------------- |
| `:FlutterCreate`     | Create new Flutter project |
| `:FlutterPubGet`     | Run `flutter pub get`      |
| `:FlutterPubUpgrade` | Run `flutter pub upgrade`  |

### 🔧 Flutter LSP Commands (via Dart LSP)

**Code Actions (with cursor on widget):**

| Keymap       | Function            | Description                         |
| ------------ | ------------------- | ----------------------------------- |
| `<leader>ca` | Code actions menu   | Wrap with widget, extract, etc.     |
| `gd`         | Go to definition    | Navigate to widget/class definition |
| `gr`         | Find references     | Find all references to widget       |
| `K`          | Hover documentation | Show widget documentation           |
| `<leader>rn` | Rename symbol       | Rename widget/variable              |

**Common Code Actions:**

- Wrap with Widget
- Wrap with Column/Row/Container
- Extract Widget
- Remove this widget
- Convert to StatefulWidget

### 🐛 Flutter Debugging Commands

| Command             | Description        |
| ------------------- | ------------------ |
| `:FlutterLogClear`  | Clear Flutter logs |
| `:FlutterLogToggle` | Toggle log window  |
| `<leader>ds`        | Start debugging    |
| `<leader>db`        | Toggle breakpoint  |
| `<leader>dc`        | Continue debugging |

### 🚀 Typical Flutter Workflow

1. **Open Flutter project:** `nvim .`
2. **Select device:** `:FlutterDevices` and choose
3. **Run app:** `:FlutterRun`
4. **Edit code and save** - auto hot reload
5. **For major changes:** `:FlutterRestart`
6. **View widget tree:** `:FlutterOutlineToggle`
7. **Stop app:** `:FlutterQuit`

**💡 Flutter Development Tips:**

- Map frequently used commands to shorter keybindings in your Neovim config
- Use `<leader>ca` on any widget to see available refactoring options
- Save files frequently to trigger hot reload automatically
- Use `:FlutterOutlineToggle` to visualize your widget hierarchy

---

## 🔄 Daily Workflow

### 📥 Sync Configurations

```bash
# Update configs from remote and re-stow
cd ~/dotfiles && git pull && stow kitty && stow nvim
```

### ⚡ Quick Access

```bash
# Edit dotfiles with telescope
cd ~/dotfiles && nvim .
# Then use <leader>ph to find hidden files like .gitignore
```

### 🎯 Pro Tips

- Use `<leader>gs` for all Git operations within Neovim
- Leverage Harpoon for quick file switching in large projects
- Combine Telescope with multi-grep for powerful code searching
- Use splits for side-by-side file comparison and editing
- Take advantage of LSP features for intelligent code navigation
