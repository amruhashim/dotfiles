# dotfiles

My Neovim, WezTerm and kitty configs. Laid out for GNU Stow, used on macOS and Windows.

```
nvim/       ~/.config/nvim
wezterm/    ~/.config/wezterm
kitty/      ~/.config/kitty
karabiner/  ~/.config/karabiner
```

## Install

macOS:

```bash
brew install neovim stow ripgrep fd cmake
brew install --cask font-jetbrains-mono font-jetbrains-mono-nerd-font font-victor-mono-nerd-font

git clone https://github.com/amruhashim/dotfiles ~/dotfiles
cd ~/dotfiles
stow nvim wezterm kitty
git submodule update --init   # kitty themes
```

Open `nvim` once and lazy.nvim installs everything. Mason pulls the language servers on first start.

Windows has no stow, so clone to `%USERPROFILE%\dotfiles` and link the folders by hand:

```bat
mklink /D %LOCALAPPDATA%\nvim %USERPROFILE%\dotfiles\nvim\.config\nvim
mklink /D %USERPROFILE%\.config\wezterm %USERPROFILE%\dotfiles\wezterm\.config\wezterm
```

Put the fonts in the per-user font folder; `wezterm.lua` scans it directly. WezTerm starts `pwsh` there.

Things that will bite you:

- Neovim 0.11. `aerial.nvim` is pinned to its `nvim-0.11` branch and `nvim-treesitter` to `master`; both pins can go after moving to 0.12.
- `telescope-fzf-native` builds with cmake, so a C compiler has to be around.
- `<leader>pd` needs `fd`, `<leader>fg` needs `rg`.
- `kitty.conf` includes `kitty-themes/themes/kanagawa.conf`, but the `kitty-themes` submodule (dexpota/kitty-themes) has no kanagawa theme, so that line does nothing. Point it at one of the themes that exist or drop a `kanagawa.conf` in there. WezTerm has the palette inlined.
- Karabiner rewrites its config file, so stowing `karabiner` only works if `~/.config/karabiner/karabiner.json` isn't already there. Move the existing one out first.

After adding files to a package, `stow -R nvim` relinks it. `stow -D nvim` removes the links.

## Neovim

Leader is space. Plugins are listed in `lua/plugins.lua` (lazy.nvim), each one's setup is in `after/plugin/`. Colorscheme is kanagawa wave.

What's in there: telescope, harpoon, oil, leap, fugitive, gitsigns, undotree, aerial, lsp-zero + mason + nvim-cmp, conform, treesitter, lualine, noice, auto-session, flutter-tools, autopairs, ts-autotag, Comment, smear-cursor, typr.

### Files and search

| Key | Does |
| --- | --- |
| `<leader>pv` | Oil in the cwd |
| `<leader>pV` | Oil in the current file's folder |
| `<leader>pf` | Find files |
| `<leader>ph` | Find files, hidden included |
| `<C-p>` | Find git-tracked files |
| `<leader>pd` / `<leader>pD` | Find directories / with hidden |
| `<leader>ps` | Grep for a string (prompts) |
| `<leader>fg` | Live grep with a glob filter |
| `<leader>ep` | Find files inside installed plugins |
| `<leader>pe` / `<leader>fe` | Diagnostics for the project / this file |

`<leader>fg` takes the pattern, two spaces, then a glob: `TODO  *.lua`, `app  **/src/**`. `<C-q>` in any picker sends the results to quickfix.

Inside a picker, `<C-n>`/`<C-p>` or Tab/S-Tab move the selection. `<C-j>`/`<C-k>` are turned off.

### Harpoon

| Key | Does |
| --- | --- |
| `<leader>a` | Add file |
| `<C-e>` | Menu |
| `<C-h>` `<C-t>` `<C-n>` `<C-s>` | Jump to file 1 to 4 |

### Moving around

| Key | Does |
| --- | --- |
| `s` / `S` | Leap forward / backward |
| `gs` | Leap to another window |
| `<C-d>` / `<C-u>` | Half page, cursor stays centered |
| `n` / `N` | Next / previous match, centered |
| `<C-k>` / `<C-j>` | Next / previous quickfix item |
| `<leader>k` / `<leader>j` | Next / previous location list item |
| `{` / `}` | Previous / next symbol (aerial) |

Aerial outline: `:at` toggles it, `:atl` / `:atr` pick a side, `:ao` and `:ac` open and close.

### Editing

| Key | Does |
| --- | --- |
| `J` / `K` (visual) | Move the selection down / up |
| `J` | Join lines without moving the cursor |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>p` (visual) | Paste over selection, keep the register |
| `<leader>d` | Delete to the void register |
| `<leader>s` | Substitute the word under the cursor, file-wide |
| `<leader>f` | Format the buffer |
| `<leader>u` | Undotree |
| `<leader>x` | `chmod +x` the file |
| `<leader><leader>` | Source the file |
| `<Esc>` (terminal) | Back to normal mode |

Go error snippets: `<leader>ee` (return err), `<leader>ef` (log.Fatalf), `<leader>el` (logger.Error), `<leader>ea` (assert.NoError).

### LSP

Mason installs `ts_ls`, `eslint`, `lua_ls`, `rust_analyzer`, `jsonls`, `postgres_lsp`, `clangd`, `pyright` and `ruff`. Dart comes from flutter-tools. For Python, pyright does types and hover, ruff does linting. JSON gets schemas from schemastore.

| Key | Does |
| --- | --- |
| `gd` | Definition |
| `K` | Hover |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename |
| `<leader>vca` | Code action |
| `<leader>vws` | Workspace symbols |
| `<leader>vd` | Diagnostic float |
| `[d` / `]d` | Previous / next diagnostic |
| `<C-h>` (insert) | Signature help |
| `<leader>zig` | Restart the LSP |

Completion: `<C-n>` / `<C-p>` to move, `<C-y>` to accept, `<C-Space>` to open the menu.

### Formatting

conform formats on save and falls back to the LSP.

| Language | Formatter |
| --- | --- |
| Lua | stylua |
| Python | black |
| JS, TS, CSS, HTML, JSON, YAML, Markdown | prettier |
| Rust | rustfmt |
| Go | gofmt |
| C, C++ | clang-format |
| Dart | dart format |

The formatters themselves aren't installed by this repo. Get them through Mason or your package manager.

### Git

| Key | Does |
| --- | --- |
| `<leader>gs` | Fugitive status |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Toggle blame on the current line |

In the status window: `s` stage, `u` unstage, `=` inline diff, `cc` commit, `ca` amend, `g?` for the rest.

### Flutter

These only exist in buffers where `dartls` is attached.

| Key | Does |
| --- | --- |
| `<leader>fr` | Run |
| `<leader>frl` | Hot reload |
| `<leader>fR` | Hot restart |
| `<leader>fq` | Quit |
| `<leader>fd` | Devices |
| `<leader>fo` | Widget outline |

Logs open in a new tab. Widget guides and closing tags are on, the debugger is off.

### Sessions

auto-session saves on exit and restores when nvim is opened in the same directory. It skips `~`, `~/Projects`, `~/Downloads` and `/`. `:SessionSearch` lists saved sessions.

### Typing practice

`:Typr` to start, `:TyprStats` for the dashboard.

## WezTerm

One config for both systems. The shortcuts are the same, only the modifier changes:

| | macOS | Windows |
| --- | --- | --- |
| mod | cmd | ctrl+shift |
| mod2 | cmd+shift | ctrl+alt |
| nav | cmd+alt | ctrl+alt |

| Key | Does |
| --- | --- |
| mod + `t` / `w` | New tab / close tab |
| mod + `1`..`5` | Go to tab |
| mod2 + `]` / `[` | Next / previous tab |
| mod + `d` | Split, new pane below |
| mod2 + `d` | Split, new pane to the right |
| mod2 + `w` | Close pane |
| nav + arrows | Focus pane in that direction |
| mod + `]` / `[` | Next / previous pane |
| mod2 + Enter, alt + `6` | Zoom pane |
| shift+alt + arrows | Resize pane |
| mod + `c` / `v` | Copy / paste |
| mod + `k` | Clear scrollback |
| mod + `+` / `-` / `0` | Font size |
| mod + `,` | Reload config |
| F11 | Fullscreen |

Default key bindings are disabled, so anything not listed here does nothing.

Fonts are JetBrains Mono, with Victor Mono for italics. Colors are the kanagawa wave palette, copied from what kanagawa.nvim emits so the terminal and the editor match. The cursor trail comes from `smear-cursor.nvim` because WezTerm has nothing like kitty's `cursor_trail`.

## kitty

Used on macOS. This is the config WezTerm was ported from, so the cmd shortcuts above work the same. Extras that kitty has and WezTerm doesn't:

- `alt+1`..`alt+6` switch layouts: tall, fat, grid, horizontal, vertical, stack
- `cursor_trail` for the animated cursor
