# Windots Setup Guide

This guide explains two ways to install Windots:

1. the fast script-driven path
2. the manual path where you install and connect each piece yourself

Use the script path if you want the current repo baseline quickly. Use the manual path if you want tighter control, want to understand each dependency first, or do not want the repo creating symlinks for you.

## Quick setup with the installer

Use this first if you want the current recommended baseline.

### Requirements

- Windows 11
- `winget` available
- PowerShell 7
- an elevated PowerShell session
- internet access for package installs

### Base install

```powershell
pwsh -ExecutionPolicy Bypass -File .\install.ps1
```

What this does:

- installs the base applications with `winget`
- installs Cascadia Code Nerd Font with Chocolatey when available
- links the default GlazeWM config
- links the default Flow Launcher settings
- links the default YASB config and stylesheet

Current baseline:

- GlazeWM: [config/glazewm/config.yaml](config/glazewm/config.yaml)
- Flow Launcher: [config/FlowLauncher/Settings.json](config/FlowLauncher/Settings.json)
- YASB style: [config/yasb](config/yasb/config.yaml)
- Terminal app: Windows Terminal

Important caution:

- Windows Terminal is installed, but [config/windows/terminal/settings.json](config/windows/terminal/settings.json) is backup-only and is not linked automatically

### Optional modules

```powershell
pwsh -ExecutionPolicy Bypass -File .\install.ps1 -IncludeWezTerm -IncludeObsidian
pwsh -ExecutionPolicy Bypass -File .\install.ps1 -IncludeObsidian -ObsidianVaultPath "$env:USERPROFILE\Documents\Obsidian\Main"
```

### After the script finishes

Check these before you start customizing:

- GlazeWM starts and reloads cleanly
- YASB appears and matches the selected style
- Flow Launcher opens with its configured hotkey
- `wt` opens Windows Terminal
- the shortcuts in [keybindings.md](keybindings.md) match what actually launches

If you want to understand or change the baseline before using it, continue with the manual setup path below.

## Manual setup by component

This path is slower, but it makes the dependency chain and the live file locations explicit.

## 1. Prepare Windows first

Minimum checks:

- show hidden files and file extensions in Explorer
- confirm `winget` works
- install WSL2 if you want the full Windows plus Linux workflow
- use an Administrator shell when changing system packages or symlinked config targets

Pay attention to:

- monitor layout before spending time on GlazeWM gaps
- font installation before judging icon rendering in YASB or terminals
- startup apps and notification noise before blaming the bar or window manager for clutter

## 2. Install the core applications

Install these first, either with `winget` or your own preferred package workflow:

```powershell
winget install Git.Git
winget install Microsoft.PowerShell
winget install Microsoft.WindowsTerminal
winget install glzr-io.glazewm
winget install AmN.yasb
winget install Flow-Launcher.Flow-Launcher
# winget install "Flow Launcher"
winget install Microsoft.VisualStudioCode
winget install Obsidian.Obsidian
winget install Chocolatey.Chocolatey
winget install wez.wezterm
```

Then install a Nerd Font.

Recommended options:

- Cascadia Code Nerd Font
- JetBrainsMono Nerd Font

Pay attention to:

- log out or restart apps if a new font does not show up immediately
- keep your package source choice consistent across machines where possible

## 3. Configure GlazeWM

Start with [config/glazewm/README.md](config/glazewm/README.md).

Recommended live path:

- `%USERPROFILE%\.glzr\glazewm\config.yaml`

Recommended first choice:

- [config/glazewm/config.yaml](config/glazewm/config.yaml)

Manual setup steps:

1. Copy [config/glazewm/config.yaml](config/glazewm/config.yaml) to your live GlazeWM config location.
2. Start or restart GlazeWM.
3. Test workspace switching, focus movement, floating toggle, and reload.
4. Confirm YASB starts from the `startup_commands` block.

Pay attention to:

- `alt` is reserved for window management in the current baseline
- `alt+ctrl` is reserved for launcher shortcuts
- application-specific issues usually belong in `window_rules`, not random workarounds
- do not merge all three YAML variants together blindly

Reference:

- [keybindings.md](keybindings.md)

## 4. Configure YASB

Start with [config/yasb/README.md](config/yasb/README.md).

Live paths:

- `%USERPROFILE%\.config\yasb\config.yaml`
- `%USERPROFILE%\.config\yasb\styles.css`

Manual setup steps:

1. Copy [config/yasb/config.yaml](config/yasb/config.yaml) to `%USERPROFILE%\.config\yasb\config.yaml`.
2. Copy [config/yasb/styles.css](config/yasb/styles.css) to `%USERPROFILE%\.config\yasb\styles.css`.
3. Start or restart YASB.
4. Verify the bar appears correctly with your installed font.

Pay attention to:

- some styles need more local setup than others
- weather, notes, todo, and AI-related widgets may need extra services or credentials
- style 2 is the safest shared default; styles 4 to 6 are richer but more opinionated

## 5. Configure Flow Launcher

Start with [config/FlowLauncher/README.md](config/FlowLauncher/README.md).

Live settings path:

- `%USERPROFILE%\AppData\Roaming\FlowLauncher\Settings\Settings.json`

Recommended first choice:

- [config/FlowLauncher/Settings.json](config/FlowLauncher/Settings.json)

Manual setup steps:

1. Close Flow Launcher before replacing its settings file.
2. Back up your current settings.
3. Copy [config/FlowLauncher/Settings.json](config/FlowLauncher/Settings.json) into the live settings location.
4. Reopen Flow Launcher and test the hotkey and plugin behavior.

Pay attention to:

- hotkey conflicts with GlazeWM or PowerToys
- browser and explorer profiles that may be different on each machine
- plugin settings that may hide machine-specific paths or executable assumptions

## 6. Choose your terminal path

Windows Terminal is the base default. WezTerm is optional.

### Windows Terminal

Important rule:

- [config/windows/terminal/settings.json](config/windows/terminal/settings.json) is a backup template, not an auto-deployed config

Manual setup steps:

1. Install Windows Terminal.
2. Confirm `wt` launches.
3. Open your live `settings.json`.
4. Manually compare or merge values from [config/windows/terminal/settings.json](config/windows/terminal/settings.json) only if they fit that machine.

Pay attention to:

- profile order for PowerShell, WSL, Git Bash, or other shells
- font choices and rendering
- cross-machine differences in terminal profiles and path assumptions

### WezTerm

Start with [config/WezTerm/README.md](config/WezTerm/README.md).

Recommended live path:

- `%USERPROFILE%\.wezterm.lua`

Manual setup steps:

1. Install WezTerm.
2. Copy [config/WezTerm/wezterm.lua](config/WezTerm/wezterm.lua) to `%USERPROFILE%\.wezterm.lua`.
3. Launch WezTerm and verify fonts, shell startup, and keybindings.
4. Decide whether your launchers should keep opening `wt` or switch to `wezterm-gui`.

Pay attention to:

- keep only one terminal as your mental default for launcher shortcuts


## 7. Optional Obsidian workflow

Start with [config/Obsidian/README.md](config/Obsidian/README.md).

Recommended vault path:

- `%USERPROFILE%\Documents\Obsidian\Main`

Manual setup steps:

1. Install Obsidian.
2. Create the vault folder.
3. Add the baseline folders: `0-Inbox`, `1-Projects`, `2-Reference`, `3-Archives`.
4. Verify `obsidian://` links open correctly.

Pay attention to:

- do not commit a live vault into this repo
- keep plugin state and private notes machine-local
- test the GlazeWM launcher behavior only after Obsidian itself opens correctly

## 8. Optional AI layer

Start with [config/ai/README.md](config/ai/README.md).

This layer is optional. Do not treat it as a baseline requirement.

Pay attention to:

- keep model weights, indexes, and private data out of the repo
- prefer local overrides for machine-specific AI tooling paths
- use WSL2 for helper scripts and indexing, not as the primary GUI runtime for Windows apps

## 9. Final verification checklist

Before you call the machine finished, verify:

- GlazeWM launches and reloads without breaking your desktop
- YASB renders correctly with icons and no missing files
- Flow Launcher opens reliably and has no hotkey conflict
- your chosen terminal opens from both the Start menu and your GlazeWM shortcuts
- WSL2 launches if you depend on it
- Obsidian and AI tools stay optional instead of creeping into the base dependency path


## 🔧 Setup

> [!WARNING]
> These configs are **not plug-and-play**  
> Cherry-pick what you need. Backup before applying.

<details>
<summary><strong>🪟 GlazeWM</strong></summary><br>

**NOTE:** Uses **YASB**, not Zebar.

- Install [GlazeWM](https://github.com/glzr-io/glazewm/releases)
- [`config/glazewm/config.yaml`](config/glazewm/config.yaml)

</details>

<details>
<summary><strong>🍫 YASB</strong></summary><br>

**NOTE:** Requires a Nerd Font (JetBrainsMono Nerd Font recommended).

- Install [YASB](https://github.com/amnweb/yasb/releases)
- [`config/yasb/`](config/yasb/)

</details>

<details>
<summary><strong>⌨️ VSCode</strong></summary><br>

- Install [VSCode](https://code.visualstudio.com/download)

</details>

<details>
<summary><strong>🚀 Flow Launcher</strong></summary><br>

- Install [Flow Launcher](https://www.flowlauncher.com)
- [`config/FlowLauncher/settings.json`](.config/FlowLauncher/settings.json)

</details>


<details>
<summary><strong>>_ Windows Terminal</strong></summary><br>

- Install [Windows Terminal](https://github.com/microsoft/terminal)

</details>

---
## Windows (WSL setup)
[Windows Docs for Linux on Windows](https://learn.microsoft.com/en-us/windows/wsl/install)

* Install WSL in powershell `wsl --install`
* Get gruvbox-material color scheme for Windows Terminal. 
* Open the settings.json in windows preview by opening a new tab and click on Settings while holding shift
* Paste in the colorschemes and asssign it to the Ubuntu profile in Windows Terminal

There is an issue with npm on wsl ubuntu 22. Use this to install npm: 
- [npm](https://stackoverflow.com/questions/73673804/npm-show-npm-elf-not-found-error-in-wsl)
If you have issues with vpn and wsl working together:
- [vpn](https://superuser.com/a/1818812)
* '%UserProfile%\.wslconfig' 
```
    [wsl2]
    networkingMode=mirrored
    dnsTunneling=true
```
* Restart windows

## Windows
Windows settings
- Show hidden files and folders
- Show Extensions types
* Use [chocolatey](https://chocolatey.org/install) to install Windows Terminal Preview using `choco install microsoft-windows-terminal --pre`
* Install bottom (This is top in linux)
	* alt shit + or alt shift - for horizontal/vertical 
* Install Git `choco install git`
* Install [mingw](https://nuwen.net/mingw.html)

#### Windows Terminal
1. In Settings, go to Rendering section and change Graphics API to `Direct2D` to fix font rendering issues
2. Use `Dark+` color scheme for best colors
3. For `micro`
   - Open Command Bar with `Ctrl+e`
   - Type `set colorscheme geany`
   - Restart

---

#### YASB
1. To use wallpaper gallery, save them here: `$env:USERPROFILE/Pictures/Wallpapers/Home Screen` 
2. For `clock` widget, the country code uses `YASB_CAL_COUNTRY_CODE` variable. Make sure to set a country code in your `.env` file. Check docs [here](https://docs.yasb.dev/latest/configuration