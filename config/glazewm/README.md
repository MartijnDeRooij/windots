# GlazeWM

GlazeWM is an open-source, keyboard-driven tiling window manager. Inspired by i3wm, it automatically tiles and organizes your app windows into structured layouts without overlapping. 

The usual live config path on Windows is: `%USERPROFILE%\.glzr\glazewm\config.yaml`.

---

## Important Notes

### PowerToys

Disable the following PowerToys features before using GlazeWM:

* Workspaces
* FancyZones

These features manage window placement and can conflict with GlazeWM's tiling behavior.

### YASB Shortcut Conflicts

Some YASB defaults may conflict with GlazeWM keybindings.

For example, if `Alt+Space` is already in use, adjust the binding accordingly:

```yaml
# Change focus between tiling, floating, and fullscreen windows.
- commands: ['wm-cycle-focus']
  bindings: ['alt+space']
```

## Recommended Workspace Layout

A productive GlazeWM setup focuses on predictable workspaces rather than restoring an exact previous session.

Example layout:

| Workspace | Purpose       |
| --------- | ------------- |
| 1         | Browser       |
| 2         | Development   |
| 3         | Terminal      |
| 4         | Chat / Email  |
| 5         | Miscellaneous |

Combined with window rules and startup commands, this creates a deterministic workstation where:

* applications automatically open in the correct workspace
* workspaces remain available even when empty
* commonly used applications can launch automatically
* navigation becomes consistent across reboots

GlazeWM supports this workflow through:

* `keep_alive` workspaces
* window matching rules
* startup commands
* workspace-specific automation

## How GlazeWM is structured

All three files use the same core sections:

### `general`

This section controls startup behavior and focus behavior.

- `startup_commands`: launches tools when GlazeWM starts, such as YASB or Zebar.
- `shutdown_commands`: useful for cleaning up companion processes.
- `config_reload_commands`: lets you run commands after a config reload.
- `focus_follows_cursor`: when `true`, focus changes as your mouse moves over windows.
- `toggle_workspace_on_refocus`: if enabled, refocusing the active workspace jumps back to the previous one.
- `cursor_jump`: moves the mouse automatically when focus changes.
- `hide_method`: controls how hidden workspaces are hidden.
- `show_all_in_taskbar`: controls whether all workspace windows appear in the Windows taskbar.

### `gaps`

This controls spacing between windows and the screen edge.

- `inner_gap`: the space between tiled windows.
- `outer_gap`: the margin between tiled windows and monitor edges.
- `scale_with_dpi`: keeps spacing consistent on high-DPI displays.

### `window_effects`

This section changes how focused and unfocused windows look.

- `border.enabled` and `border.color`: add a focus border.
- `hide_title_bar`: removes title bars for a cleaner tiling look.
- `corner_style`: changes rounded corner behavior on Windows 11.
- `transparency`: allows slightly transparent windows.

### `window_behavior`

This controls default states for new windows.

- `initial_state`: usually `tiling`.
- `state_defaults.floating.centered`: opens floating windows centered by default.
- `state_defaults.floating.shown_on_top`: determines whether floating windows stay above tiled ones.
- `state_defaults.fullscreen.maximized`: chooses maximize-vs-fullscreen behavior when possible.

### `workspaces`

This defines your numbered workspaces.

`keep_alive: true` is useful if you want bars or workspace widgets to keep showing those workspaces even when empty.

### `window_rules`

This is where you decide which windows GlazeWM should ignore, float, fullscreen, or move automatically.

Current examples include:

- Ignore bar windows such as YASB or Zebar.
- Ignore picture-in-picture windows.
- Ignore helper windows from PowerToys or Lively.
- Ignore Linux GUI host windows
- Apply special handling to a game window

This is the section you will change most when an application does not tile correctly.

This gives a very i3-like workflow where:

Left monitor always shows browser/content.
Right monitor always shows coding workspaces.
Opening VS Code always sends it to workspace 2.

### `binding_modes`

These are temporary keyboard layers.

- `resize`: lets you resize with `h/j/k/l` or arrow keys.
- `pause`: a "panic button" mode that disables all keybindings except the one to exit pause mode. This is useful if you accidentally lock yourself out of your mouse and keyboard input.
- This is currently simplified and uses `wm-toggle-pause` from the main keybindings instead.


### `keybindings`

This is the main keyboard-driven workflow.

- focus windows
- move windows
- resize windows
- toggle floating and fullscreen
- reload or exit GlazeWM
- switch workspaces
- move windows to workspaces

Here you add launcher shortcuts for tools like Windows Terminal, VS Code, Obsidian, Spotify, Discord, WhatsApp, Neovim in WSL, btop, and browser shortcuts.

## Issues: 

Reload instead of restarting

After edits, run the GlazeWM reload binding:

- `alt+shift+r`

### Tune the layout first

If the desktop feels wrong, start here before editing shortcuts:

- `gaps.inner_gap`
- `gaps.outer_gap`
- `window_effects.focused_window.border.color`
- `cursor_jump.trigger`

These settings have the biggest impact on daily feel.

If an app opens in the wrong state, the right fix is usually a rule, not a manual workaround.

Examples:

```yaml
window_rules:
  - commands: ["ignore"]
    match:
      - window_process: { equals: "SomeOverlayApp" }

  - commands: ["set-floating", "move --workspace 9"]
    match:
      - window_process: { equals: "CalculatorApp" }
```