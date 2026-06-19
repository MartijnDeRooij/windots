## ⌨️ Keybindings 

You can always change these in your `.glzr\glazewm\config.yaml`

### 🪟 Window Management & Navigation

| Keys                                    | Action                                                        |
|----------------------------------------|---------------------------------------------------------------|
| <kbd>alt</kbd> + <kbd>h \| j \| k \| l</kbd>                   | Focus window left \| down \| up \| right                     |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>h \| j \| k \| l</kbd>  | Move focused window left \| down \| up \| right              |
| <kbd>alt</kbd> + <kbd>q</kbd>         | Close focused window                                         |
| <kbd>alt</kbd> + <kbd>1 - 9</kbd>     | Focus workspace {n}                                         | 
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>1 - 9</kbd>            | Move focused window to workspace {n}                         |
| <kbd>alt</kbd> + <kbd>m</kbd>         | Toggle window minimization                                  |
| <kbd>alt</kbd> + <kbd>f</kbd>         | Toggle window maximization                                  |
| <kbd>alt</kbd> + <kbd>v</kbd>         | Change tiling direction                                     |
| <kbd>alt</kbd> + <kbd>t</kbd>         | Toggle floating/tiled window state                          |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>e</kbd>                | Exit GlazeWM                                                |


### 🚀 Custom App & Browser Shortcuts

| Keys                              | Action              | Keys                          | Action                     |
| --------------------------------- | ------------------- | ----------------------------- | -------------------------- |
| <kbd>alt</kbd> + <kbd>enter</kbd> | Open Terminal (WSL) | <kbd>alt</kbd> + <kbd>p</kbd> | Open Terminal (PowerShell) |
| <kbd>alt</kbd> + <kbd>e</kbd>     | Open File Explorer  | <kbd>alt</kbd> + <kbd>c</kbd> | Open VSCode                |
| <kbd>alt</kbd> + <kbd>o</kbd>     | Open Obsidian       | <kbd>alt</kbd> + <kbd>m</kbd> | Open Spotify               |
| <kbd>alt</kbd> + <kbd>d</kbd>     | Open Discord        | <kbd>alt</kbd> + <kbd>w</kbd> | Open WhatsApp              |
| <kbd>alt</kbd> + <kbd>n</kbd>     | Open Neovim         | <kbd>alt</kbd> + <kbd>s</kbd> | Open btop                  |
| <kbd>alt</kbd> + <kbd>b</kbd>     | Open Zen Browser    | <kbd>alt</kbd> + <kbd>y</kbd> | Open YouTube               |
| <kbd>alt</kbd> + <kbd>x</kbd>     | Open X (Twitter)    | <kbd>alt</kbd> + <kbd>a</kbd> | Open ChatGPT               |

### 🚀 Custom App & Browser Shortcuts

| Keys                              | Action              | Keys                          | Action                     |
| --------------------------------- | ------------------- | ----------------------------- | -------------------------- |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>enter</kbd> | Open Windows Terminal | <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>p</kbd> | Open Windows Terminal PowerShell profile |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>e</kbd>     | Open File Explorer     | <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>c</kbd> | Open VS Code |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>o</kbd>     | Open Obsidian          | <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>b</kbd> | Open the default browser |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>g</kbd>     | Open GitHub            | <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>a</kbd> | Open ChatGPT |

---

### 🔁 Utility Shortcuts

| Keys | Action |
| ---- | ------ |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>b</kbd> | Restart YASB |

### 🧭 Conflict Policy

- Do not assign app launchers directly on plain `alt+letter` shortcuts; that layer belongs to tiling and workspace actions.
- Prefer `alt+ctrl` for launchers and web shortcuts.
- If a component-specific config introduces a new global hotkey, document it here before treating it as default.