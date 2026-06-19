# YASB Config

[YASB](https://github.com/amnweb/yasb) [(Yet Another Status Bar)](https://yasb.dev/) is a highly configurable status bar for Windows, written in Python, with support for many widgets, easy theming, and deep customization.

## How YASB is structured

- `config.yaml`: widget declarations, bar layout, callbacks, and menu behavior
- `styles.css`: visual styling, spacing, colors, and typography

You can think of `config.yaml` as behavior and `styles.css` as presentation.

## Dependencies

- [GlazeWM](../glazewm/README.md) for the canonical default workflow
- a Nerd Font for widget icons
- YASB itself, installable with `winget install AmN.yasb`

### Install target

The active YASB files are expected at:

- `%USERPROFILE%\.config\yasb\config.yaml`
- `%USERPROFILE%\.config\yasb\styles.css`

The installer links those files from the selected style directory.

## [Widgets](https://github.com/amnweb/yasb#%EF%B8%8F-list-of-currently-available-widgets-in-yasb)

| Widget | Purpose |
| --- | --- |
| [`home`](https://github.com/amnweb/yasb/wiki/(Widget)-Home) | Usually a launcher/menu button opening a custom menu or shortcuts. |
| [`glazewm_workspaces`](https://github.com/amnweb/yasb/wiki/(Widget)-GlazeWM-Workspaces) | Shows GlazeWM workspaces and allows switching between them. |
| [`lines`](https://github.com/amnweb/yasb/wiki/(Widget)-Lines) | Visual separator between widgets. |
| [`notes`](https://github.com/amnweb/yasb/wiki/(Widget)-Notes) | Quick notes widget. |
| [`todo`](https://github.com/amnweb/yasb/wiki/(Widget)-Todo) | To-do list widget. |
| [`ai_chat`](https://github.com/amnweb/yasb/wiki/(Widget)-AI-Chat) | Quick launcher/integration for AI chat tools (depends on config). |
| [`media`](https://github.com/amnweb/yasb/wiki/(Widget)-Media) | Current media playback info (Spotify, browser media, etc.). |
| [`active_window`](https://github.com/amnweb/yasb/wiki/(Widget)-Active-Window) | Shows the title of the currently focused window. |
| [`clock`](https://github.com/amnweb/yasb/wiki/(Widget)-Clock) | Time and date display. |
| [`pomodoro`](https://github.com/amnweb/yasb/wiki/(Widget)-Pomodoro) | Pomodoro timer for focused work sessions. |
| [`taskbar`](https://github.com/amnweb/yasb/wiki/(Widget)-Taskbar) | Windows taskbar-like application buttons. |
| [`microphone`](https://github.com/amnweb/yasb/wiki/(Widget)-Microphone) | Microphone mute status and controls. |
| [`volume`](https://github.com/amnweb/yasb/wiki/(Widget)-Volume) | System audio volume display and control. |
| [`bluetooth`](https://github.com/amnweb/yasb/wiki/(Widget)-Bluetooth) | Bluetooth status and connected devices. |
| [`wifi`](https://github.com/amnweb/yasb/wiki/(Widget)-WiFi) | Wireless network status, signal strength, SSID. |
| [`battery`](https://github.com/amnweb/yasb/wiki/(Widget)-Battery) | Battery percentage, charging status, remaining time. |
| [`power_menu`](https://github.com/amnweb/yasb/wiki/(Widget)-Power-Menu) | Shutdown, restart, sleep, lock, logout menu. |
| [`notifications`](https://github.com/amnweb/yasb/wiki/(Widget)-Notifications) | Notification count and notification center access. |

### Widgets intentionally left out

| Widget | Purpose |
| --- | --- |
| [`bin`](https://github.com/amnweb/yasb/wiki/(Widget)-Bin) | Windows Recycle Bin status and actions. |
| [`brightness`](https://github.com/amnweb/yasb/wiki/(Widget)-Brightness) | Screen brightness control and display. |
| [`cpu`](https://github.com/amnweb/yasb/wiki/(Widget)-CPU) | CPU usage, load, temperature (depending on configuration). |
| [`disk`](https://github.com/amnweb/yasb/wiki/(Widget)-Disk) | Disk usage, free space, read/write stats. |
| [`glazewm_binding_mode`](https://github.com/amnweb/yasb/wiki/(Widget)-GlazeWM-Binding-Mode) | Shows the current GlazeWM binding mode (resize mode, pause mode, etc.). |
| [`gpu`](https://github.com/amnweb/yasb/wiki/(Widget)-GPU) | GPU utilization, VRAM usage, temperature (if supported). |
| [`memory`](https://github.com/amnweb/yasb/wiki/(Widget)-Memory) | RAM usage statistics. |
| [`open_meteo`](https://github.com/amnweb/yasb/wiki/(Widget)-Open-Meteo) | Weather information using Open-Meteo. |
| [`sysinfo`](https://github.com/amnweb/yasb/wiki/(Widget)-SysInfo) | Combined system statistics (CPU, RAM, temperatures, etc.). |
| [`systray`](https://github.com/amnweb/yasb/wiki/(Widget)-System-Tray) / [`system-tray`](https://github.com/amnweb/yasb/wiki/(Widget)-System-Tray) | Windows notification area (tray icons). |
| [`wallpapers`](https://github.com/amnweb/yasb/wiki/(Widget)-Wallpapers) | Wallpaper switcher/manager. |
| [`weather`](https://github.com/amnweb/yasb/wiki/(Widget)-Weather) | Weather display (possibly a different provider than `open_meteo`). |
| [`traffic`](https://github.com/amnweb/yasb/wiki/(Widget)-Traffic) | Network traffic monitoring (upload/download throughput and usage statistics). |