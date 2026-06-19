## ⌨️ Keybindings

This file is the canonical shortcut overview for the current repo state.

The main global bindings come from GlazeWM in `.glzr\glazewm\config.yaml`.
Program-specific sections below list other configured shortcuts from the provided files.

### ⚠️ Current Conflicts

| Keys | Conflict | Notes |
| ---- | -------- | ----- |

### 🧭 Conflict Policy

- Prefer `alt+ctrl` for launchers and web shortcuts.
- If a component-specific config introduces a new global hotkey, document it here before treating it as default.
- Check Flow Launcher and GlazeWM first when a shortcut appears to stop working globally.

### 🪟 General GlazeWM Window Management

| Keys | Action |
| ---- | ------ |
| <kbd>alt</kbd> + <kbd>h</kbd> or <kbd>left</kbd> | Focus window left |
| <kbd>alt</kbd> + <kbd>l</kbd> or <kbd>right</kbd> | Focus window right |
| <kbd>alt</kbd> + <kbd>k</kbd> or <kbd>up</kbd> | Focus window up |
| <kbd>alt</kbd> + <kbd>j</kbd> or <kbd>down</kbd> | Focus window down |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>h</kbd> or <kbd>left</kbd> | Move focused window left |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>l</kbd> or <kbd>right</kbd> | Move focused window right |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>k</kbd> or <kbd>up</kbd> | Move focused window up |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>j</kbd> or <kbd>down</kbd> | Move focused window down |
| <kbd>alt</kbd> + <kbd>u</kbd> | Resize width -2% |
| <kbd>alt</kbd> + <kbd>p</kbd> | Resize width +2% |
| <kbd>alt</kbd> + <kbd>o</kbd> | Resize height +2% |
| <kbd>alt</kbd> + <kbd>i</kbd> | Resize height -2% |
| <kbd>alt</kbd> + <kbd>r</kbd> | Enable resize mode |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>p</kbd> | Toggle pause mode |
| <kbd>alt</kbd> + <kbd>v</kbd> | Toggle tiling direction |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>space</kbd> | Cycle focus between tiling, floating, and fullscreen |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>space</kbd> | Toggle floating and center window |
| <kbd>alt</kbd> + <kbd>t</kbd> | Toggle tiling |
| <kbd>alt</kbd> + <kbd>f</kbd> | Toggle fullscreen |
| <kbd>alt</kbd> + <kbd>m</kbd> | Toggle minimized |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>q</kbd> | Close focused window |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>e</kbd> | Exit GlazeWM |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>r</kbd> | Reload GlazeWM config |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>w</kbd> | Redraw windows |

### 🧱 GlazeWM Workspaces And Monitors

| Keys | Action |
| ---- | ------ |
| <kbd>alt</kbd> + <kbd>enter</kbd> | Open `cmd` |
| <kbd>alt</kbd> + <kbd>s</kbd> | Focus next active workspace |
| <kbd>alt</kbd> + <kbd>a</kbd> | Focus previous active workspace |
| <kbd>alt</kbd> + <kbd>d</kbd> | Focus recent workspace |
| <kbd>alt</kbd> + <kbd>1</kbd> to <kbd>9</kbd> | Focus workspace 1 to 9 |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>a</kbd> | Move workspace left monitor |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>f</kbd> | Move workspace right monitor |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>d</kbd> | Move workspace up monitor |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>s</kbd> | Move workspace down monitor |
| <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>1</kbd> to <kbd>9</kbd> | Move focused window to workspace 1 to 9 and follow it |

### 🚀 GlazeWM Launcher Shortcuts

| Keys | Action |
| ---- | ------ |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>enter</kbd> | Open Windows Terminal |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>p</kbd> | Open Windows Terminal PowerShell profile |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>e</kbd> | Open File Explorer |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>c</kbd> | Open VS Code |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>o</kbd> | Open Obsidian via `obsidian://open` |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>b</kbd> | Open default browser to Startpage |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>g</kbd> | Open GitHub |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>a</kbd> | Open ChatGPT |
| <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>b</kbd> | Restart YASB |

### 📐 GlazeWM Resize Mode

Enabled with <kbd>alt</kbd> + <kbd>r</kbd>.

| Keys | Action |
| ---- | ------ |
| <kbd>h</kbd> or <kbd>left</kbd> | Resize width -2% |
| <kbd>l</kbd> or <kbd>right</kbd> | Resize width +2% |
| <kbd>k</kbd> or <kbd>up</kbd> | Resize height +2% |
| <kbd>j</kbd> or <kbd>down</kbd> | Resize height -2% |
| <kbd>escape</kbd> or <kbd>enter</kbd> | Exit resize mode |

### 🔎 Flow Launcher

Global launcher and in-app navigation from `config/FlowLauncher/Settings.json` and `config/FlowLauncher/README.md`.

| Keys | Action |
| ---- | ------ |
| <kbd>alt</kbd> + <kbd>space</kbd> | Open Flow Launcher |
| <kbd>lwin</kbd> | Open Flow Launcher through the Win Hotkey plugin |
| <kbd>f1</kbd> | Preview selected result |
| <kbd>ctrl</kbd> + <kbd>tab</kbd> | Autocomplete |
| <kbd>tab</kbd> | Select next item |
| <kbd>shift</kbd> + <kbd>tab</kbd> | Select previous item |
| <kbd>pageup</kbd> | Select next page |
| <kbd>pagedown</kbd> | Select previous page |
| <kbd>ctrl</kbd> + <kbd>o</kbd> | Open context menu |
| <kbd>ctrl</kbd> + <kbd>i</kbd> | Open settings window |
| <kbd>ctrl</kbd> + <kbd>h</kbd> | Open history |
| <kbd>ctrl</kbd> + <kbd>up</kbd> | Cycle history up |
| <kbd>ctrl</kbd> + <kbd>down</kbd> | Cycle history down |
| <kbd>alt</kbd> + <kbd>g</kbd> | Dialog jump |

Configured Flow Launcher search keywords:

| Keyword | Action |
| ------- | ------ |
| <kbd>b</kbd> | Browser Bookmarks |
| <kbd>?</kbd> | Plugin Indicator |
| <kbd>pm</kbd> | Plugins Manager |
| <kbd>kill</kbd> | Process Killer |
| <kbd>&gt;</kbd> | Shell |
| <kbd>s</kbd> | Windows Settings |
| <kbd>st</kbd> | Speed Test |
| <kbd>str</kbd> | StringUtils |
| <kbd>ad</kbd> | Audio Device Selector |
| <kbd>gg</kbd> | Google web search |

Notes:

- `st` is assigned to both Speed Test and Steam Launcher in `Settings.json`.

### 📝 Obsidian

These are suggested in-app hotkeys from `config/Obsidian/README.md`.

| Keys | Action |
| ---- | ------ |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>d</kbd> | Open today's daily note |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>w</kbd> | QuickAdd: work item or new work item note |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>t</kbd> | Open ToDo |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>n</kbd> | Open standard notes |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>[</kbd> | Previous daily note |
| <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>]</kbd> | Next daily note |
| <kbd>ctrl</kbd> + <kbd>p</kbd> | Command palette |
