# Neovim Config

Personal Neovim configuration built on top of LazyVim. The goal is a practical IDE setup with a small local override layer: LazyVim provides the base behavior, `lazyvim.json` declares extras, and `lua/plugins/` only keeps custom preferences or extra plugins.

## Highlights

- LazyVim base with `lazy.nvim`
- Completion via `blink.cmp` with super-tab behavior
- LSP, formatting, linting, Tree-sitter, DAP, and language extras managed by LazyVim
- Git workflow with `gitsigns.nvim`, Diffview, LazyGit, and Octo
- AI workflow with Avante using a local OpenAI-compatible endpoint
- Python virtualenv selection, DAP integration, and cleanup of debugpy artifacts
- Snacks picker/explorer, statuscolumn, image support, scratch buffers, zen/dim modes
- Focused local plugin files with duplicate LazyVim defaults removed

## Requirements

- Neovim 0.10+ recommended
- Git
- `rg` and `fd` for search
- Nerd Font for icons
- Node.js for markdown preview and some ecosystem tools
- Rust/Cargo for `code-minimap`
- Optional: `lazygit`, `gh`, `jira`, database clients, language toolchains

Useful installs on macOS:

```bash
brew install neovim ripgrep fd lazygit gh
cargo install --locked code-minimap
```

## Install

```bash
git clone https://github.com/fangf057/nvim_config ~/.config/nvim
nvim
```

On first launch, Lazy will install plugins and Mason-managed tools. After install finishes, restart Neovim once.

If GitHub is slow or blocked, run Neovim with your local proxy:

```bash
HTTPS_PROXY=http://127.0.0.1:7890 \
HTTP_PROXY=http://127.0.0.1:7890 \
ALL_PROXY=socks5h://127.0.0.1:7890 \
nvim
```

## Structure

```text
.
├── init.lua
├── lazyvim.json              # LazyVim extras
├── lazy-lock.json            # plugin lockfile
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── avante.lua
│       ├── blink.lua
│       ├── dap.lua
│       ├── flash.lua
│       ├── gitsigns.lua
│       ├── lspsaga.lua
│       ├── snacks.lua
│       └── ...
└── stylua.toml
```

## LazyVim Extras

Extras are managed in `lazyvim.json`, not manually imported from `lua/config/lazy.lua`.

Enabled areas include:

- AI: Avante
- Coding: Blink, LuaSnip, mini-comment, mini-surround, Yanky
- DAP: core debugging
- Editor: dial, inc-rename, mini-files, outline, refactoring, snacks explorer, telescope
- Languages: clangd, cmake, docker, git, go, json, markdown, python, rust, sql, tailwind, toml, typescript, yaml
- UI/util: treesitter-context, dot, mini-hipatterns, rest

Removed to reduce overlap: aerial, mini-diff, dashboard-nvim, edgy, smear-cursor, vscode extra.

## Important Local Choices

### Avante

Avante is enabled and configured to use a local OpenAI-compatible endpoint:

```text
http://127.0.0.1:1337/v1
model: Qwen3_5-4B_Q4_K_M
```

The local file only keeps provider-specific preferences. Build steps, dependencies, and commands come from the LazyVim Avante extra.

### Git

This config uses `gitsigns.nvim` instead of `mini-diff`, mainly to keep current-line blame:

```lua
current_line_blame = true
```

Diffview and LazyGit are also available for larger Git workflows.

### Movement

`nvim-spider` does not override native `w/e/b/ge`. Spider motions are mapped to:

| Key | Action |
| --- | --- |
| `gw` | Spider word forward |
| `gE` | Spider end forward |
| `gb` | Spider word backward |
| `gB` | Spider end backward |

### Multi-cursor

Multi-cursor mappings live under `<leader>m...` to avoid taking over common Vim keys:

| Key | Action |
| --- | --- |
| `<leader>mj` | Add cursor below |
| `<leader>mk` | Add cursor above |
| `<leader>mJ` | Skip cursor below |
| `<leader>mK` | Skip cursor above |
| `<leader>ma` | Add cursors to matches |
| `<leader>mn` | Next cursor |
| `<leader>mp` | Previous cursor |
| `<leader>mx` | Delete cursor |
| `<leader>ml` | Align cursors |

### Python

Python support uses LazyVim's Python extra plus `venv-selector.nvim`.

| Key | Action |
| --- | --- |
| `,v` | Select virtualenv |
| `<leader>dPt` | Debug Python test method |
| `<leader>dPc` | Debug Python test class |

Project-local `.venv/bin/python` is preferred for debugpy when available.

## Common Keys

| Key | Action |
| --- | --- |
| `<leader><space>` | Find files |
| `<leader>/` | Grep |
| `<leader>e` | Explorer |
| `<leader>fp` | Projects |
| `<leader>ft` | Floating terminal |
| `<leader>fT` | Horizontal terminal |
| `<leader>lg` | LazyGit |
| `<leader>gdo` | Open Diffview |
| `<leader>gdc` | Close Diffview |
| `<leader>tc` | Toggle coverage |
| `<leader>cp` | Markdown preview |
| `<leader>od` | DBee database client |
| `<leader>xj` | Jira |
| `<leader>cn` | Generate docstring |
| `<leader>uz` | Zen mode |
| `<leader>uD` | Dim mode |

Use which-key (`<leader>` pause) for the full current keymap.

## Maintenance

Health check:

```vim
:checkhealth
```

Sync plugins:

```vim
:Lazy sync
```

Clean unused plugin directories after removing extras/plugins:

```vim
:Lazy clean
```

Headless smoke test:

```bash
nvim --headless '+lua print("startup ok")' '+qa'
nvim --headless '+checkhealth' '+qa'
```

## Notes

- `lua/config/lazy.lua` imports LazyVim and local plugins only. Extras should stay in `lazyvim.json`.
- `lazy-lock.json` is committed so plugin versions are reproducible.
- Provider checks for Node, Python, Ruby, and Perl are intentionally disabled in `options.lua` unless a plugin needs them.
- `stylua` is not bundled here. Install it separately if you want formatting from the shell.
