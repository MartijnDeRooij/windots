# WezTerm Configs

This folder contains the optional WezTerm configurations for Windots.

WezTerm is not the default base terminal in Windots. The canonical base path uses Windows Terminal. WezTerm remains a supported alternate terminal if you want richer Lua-driven customization.

## Files

| File | Purpose | Notes |
| --- | --- | --- |
| [Wezterm](./wezterm.lua) | Rich Windows-native preset | More complete UI, font, cursor, and keybinding setup. This is the installer default when WezTerm is enabled. |

## Install target

- `%USERPROFILE%\.wezterm.lua`

Use the installer to enable it:

```powershell
winget install wez.wezterm
```

## When to use WezTerm

Pick WezTerm if you want:

- a Lua-configurable terminal
- more control over rendering and cursor behavior
- an alternate terminal from Windows Terminal

Stay on Windows Terminal if you want the simpler default path that matches the main installer baseline.

## Portability notes

- Fonts must exist on the system, especially Nerd Fonts.
- If you keep both Windows Terminal and WezTerm installed, decide which one your launcher and GlazeWM shortcuts should open.