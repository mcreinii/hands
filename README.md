# Hands

**Hands** is a modern-ish Neovim configuration for people who love features but hate fancy UIs that hurt their eyes :3

It aims to provide a smooth coding experience while keeping things minimal and easy on the eyes.

---

## Features

* **Language Servers** (LSP) for smart code insights
* **Code completion** with autocompletion suggestions
* **Syntax highlighting** for various languages
* **Snacks picker** for quick actions
* **Live grep** for fast project search
* **File explorer** for easy navigation
* **Single borders** UI style
* **Minimal statusline**
* **Markdown rendering** inside Neovim
* **Easy surrounding** (like `sa` and `sr` using mini.surround)
* **Notification daemon**
* **Lazygit integration** for Git/GitHub management
* **Other quality-of-life improvements**

---

## Installation

### Linux

```bash
# Backup existing Neovim config
mv ~/.config/nvim{,.bak}

# Optional but recommended: backup local data
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone Hands configuration
git clone https://github.com/Hands/nvim ~/.config/nvim

# Remove git folder to make it your own repo (contribute pls :3)
rm -rf ~/.config/nvim/.git

# Launch Neovim
nvim
```

### Windows (PowerShell)

```powershell
# Backup existing Neovim config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# Optional but recommended: backup local data
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Clone Hands configuration
git clone https://github.com/Hands/nvim $env:LOCALAPPDATA\nvim

# Remove git folder to make it your own repo (contribute pls :3)
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# Launch Neovim
nvim
```

---

## Configuration 🛠️

Customize Hands to your heart’s content!  

### Options ⚙️

Edit `lua/core/init.lua` and find:

```lua
require("core.options").setup({
    -- put the options you want to change here
})
````

**Example:**

```lua
require("core.options").setup({
    number = true,         -- show line numbers
    relativenumber = true, -- relative line numbers
    mouse = "a",           -- enable mouse support
    clipboard = "unnamedplus"
})
```

### Keymaps ⌨️

Edit `lua/core/init.lua` and find:

```lua
require("core.keymaps").setup({
    n = {
        {"<leader>q", ":q!<CR>", desc = "QUIT!!!!! 🚀"},   -- quick escape!
        {"<leader>w", ":w<CR>", desc = "SAVE 💾"}        -- because saving is caring
    },
    v = {
        -- add visual mode shortcuts here
    },
    t = {
        -- add terminal mode shortcuts here
    },
})
```

💡 *Tip:* Use descriptive `desc` strings—they show up in which-key menus and make your shortcuts easier to remember.

---

### Notes / Tips

* After the first launch, Neovim may install plugins automatically.
* You can tweak your config in `~/.config/nvim` (Linux) or `$env:LOCALAPPDATA\nvim` (Windows).
* To contribute, fork the repo and make changes after removing the `.git` folder.
