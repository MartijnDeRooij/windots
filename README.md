# Windots

A riced, Unix-inspired Windows environment.

After years of using Linux and maintaining dotfiles, I wanted a similar experience on Windows without sacrificing native Windows compatibility. This repository contains my Windows configuration ("windots"), application settings, theming, and workflow customizations built around Windows 11 and WSL2.

The goal is to create a productive and consistent environment that combines:

- Windows 11 as the primary desktop OS but if dotfiles alone is used it works basicly the same. 
- WSL2 for Linux development workflows
- Keyboard-driven navigation
- Tiling window management
- Terminal-centric tooling
- Consistent theming across applications
- Reproducible configuration through version-controlled files

Many configurations are shared with or inspired by my Linux dotfiles, allowing a familiar workflow across both platforms.

## ℹ️ System Overview

<details>

<summary>🪟 <b>System</b></summary>

<br>

| 📚 Entry                           	 | ✨ App                  |
|----------------------------------------|--------------------------|
| **OS** | [Windows 11](https://www.microsoft.com/en-in/windows/windows-11) + [WSL2](https://learn.microsoft.com/en-us/windows/wsl/) 🐧 |
| **Window Manager** | [GlazeWM](https://github.com/glzr-io/glazewm) [⚙️](config/glazewm/config.yaml) <br> **Optional:** [PowerToys FancyZones](https://learn.microsoft.com/en-us/windows/powertoys/fancyzones) |
| **Application Launcher** | [Flow Launcher](https://www.flowlauncher.com/) [⚙️](config/FlowLauncher/settings.json) <br> **Optional:** [PowerToys Run](https://learn.microsoft.com/en-us/windows/powertoys/run) <br> **Optional:** [PowerToys Command Palette](https://learn.microsoft.com/en-us/windows/powertoys/command-palette) |
| **Bar** | 💖 [YASB](https://github.com/amnweb/yasb) [⚙️](config/yasb/) <br> **Optional:** [Zebar](https://github.com/glzr-io/zebar) |

</details>

<details>
	
<summary>🖥️ <b>CLI/TUI Apps</b> </summary>

<br>

| 📚 Entry                           	 | ✨ App                  |
|----------------------------------------|--------------------------|
| **Terminal Emulator** | [Windows Terminal](https://github.com/microsoft/terminal) [⚙️](config/terminal/settings.json) <br> **Optional:** [WezTerm](https://github.com/wez/wezterm) [⚙️](config/WezTerm/README.md) |
| **Terminal Multiplexer** | [tmux](https://github.com/tmux/tmux) [⚙️](https://github.com/MartijnDeRooij/dev-env-dotfiles/blob/main/Editors/terminal/.tmux.conf) |
| **IDE** | [neovim](https://neovim.io/) [⚙️](https://github.com/MartijnDeRooij/dev-env-dotfiles/tree/main/Editors/nvim) |
| **IDE** | [VSCode](https://code.visualstudio.com/) [⚙️](config/vscode/settings.json) |
| **Fuzzy File Finder** | [fzf](https://github.com/junegunn/fzf) |
| **Git Bash** | [git](https://git-scm.com/) |

</details>

<details>
	
<summary>🖥️ <b>Development Tools</b> </summary>

<br> 


| 📚 Entry | ✨ App |
|----------|--------|
| **CMake** | [CMake](https://cmake.org/) |
| **Doxygen** | [Doxygen](https://www.doxygen.nl/) |
| **C++ Testing Framework** | [Google Test](https://github.com/google/googletest) |
| **MiniGW** | [MiniGW](https://nuwen.net/mingw.html) |


</details>

<details>

<summary>🖱️ <b>GUI Apps</b></summary>

<br>

| 📚 Entry                           	 | ✨ App                  |
|----------------------------------------|--------------------------|
| **Note Taking App** | [Obsidian](https://obsidian.md/) See [README](config/Obsidian/README.md) for setup |
| **Web Browser** |  Firefox 🏡 <br> LibreWolf <br> Brave <br> Chromium |
| **Email Client** | [Thunderbird](https://www.thunderbird.net/) |
| **Chat App** | [Discord](https://discord.com/) |
| **Office Apps** | [LibreOffice](https://www.libreoffice.org/) |
| **Remote Access** | [MobaXterm](https://mobaxterm.mobatek.net/) <br> [WinSCP](https://winscp.net/) |
| **VPN / Mesh Network** | [Tailscale](https://tailscale.com/) |
| **Network Analysis** | [Wireshark](https://www.wireshark.org/) |
| **Torrent Client** | [Transmission](https://transmissionbt.com/) |
| **File Sharing** | [LocalSend](https://localsend.org/) |
| **Disk Imaging** | [Raspberry Pi Imager](https://www.raspberrypi.com/software/) |
| **IRC Client** | [HexChat](https://hexchat.github.io/) |
| **7-Zip** | [7-Zip](https://www.7-zip.org/) |

</details>

<details>

<summary>🖱️ <b>Creative / Media Apps</b></summary>

<br>

| 📚 Entry                           	 | ✨ App                  |
|----------------------------------------|--------------------------|
| **Image Editor** | [GIMP](https://www.gimp.org/) |
| **Video Editing** | [DaVinci Resolve](https://www.blackmagicdesign.com/products/davinciresolve) |
| **Screen Recording & Streaming** | [OBS Studio](https://obsproject.com/) |
| **Media Player** | [VLC](https://www.videolan.org/vlc/) |
| **Media Processing** | [FFmpeg](https://ffmpeg.org/) |
| **Inkscape** | [Inkscape](https://inkscape.org/) |

</details>
<details>

<summary>🖱️ <b>Game Apps</b></summary>

<br>

| 📚 Entry                           	 | ✨ App                  |
|----------------------------------------|--------------------------|
| **Game Launcher** | [Steam](https://store.steampowered.com/) <br> [Prism Launcher](https://prismlauncher.org/) |
| **Emulator Frontend** | [RetroArch](https://www.retroarch.com/) |
| **Game Mod Manager** | [r2modman](https://thunderstore.io/package/ebkr/r2modman/) |
| **Multiworld Client** | [Archipelago](https://archipelago.gg/) |
| **Game Client** | [RuneLite](https://runelite.net/) |
| **Game Client** | [Jagex Launcher](https://www.jagex.com/en-GB/launcher) |
| **Multiworld Client** | [Archipelago](https://archipelago.gg/) |
| **Minecraft** | [Minecraft Launcher](https://www.minecraft.net/download) |

</details>
 
<details>
	
<summary>🔍 <b>Theming</b></summary>

<br>

| 📚 Entry                              | ✨ App                  |
|---------------------------------------|--------------------------|
| **Colorscheme**                       | [Catppuccin Mocha](https://catppuccin.com) |
| **Font**                  			| [JetBrainsMono Nerd Font](https://www.jetbrains.com/lp/mono/) |

</details>

<details>

<summary>📦 <b>Optional / Legacy Tools</b></summary>

<br>
An short list of things I came across but will not be using

| 📚 Entry                 | ✨ App                                                                                   		|
| ------------------------ | ---------------------------------------------------------------------------------------------|
| **Shell**                | [Zsh](https://zsh.sourceforge.io/) |
| **Prompt**               | [Oh My Posh](https://ohmyposh.dev/) |
| **Directory Navigation** | [zoxide](https://github.com/ajeetdsouza/zoxide) |
| **ls Replacement**       | [eza](https://github.com/eza-community/eza) |
| **cat Replacement**      | [bat](https://github.com/sharkdp/bat) |
| **System Monitor**       | [btop](https://github.com/aristocratos/btop), [bott](https://github.com/ClementTsang/bottom) |
| **System Fetch**         | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| **Audio Visualizer**     | [cava](https://github.com/karlstav/cava) |
| **Windows Mods**         | [Windhawk](https://windhawk.net/) |
| **File Manager**         | [yazi](https://yazi-rs.github.io/) |
| **File Manager** | [File Pilot](https://filepilot.tech/) / File Explorer |
| **Shell** | [pwsh](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pwsh?view=powershell-7.4) |

</details>

## Guides

- [config/glazewm/README.md](config/glazewm/README.md) for the window-manager setup and customization path
- [config/yasb/README.md](config/yasb/README.md) for bar styles 
- [config/FlowLauncher/README.md](config/FlowLauncher/README.md) for launcher presets, plugin guidance, and portability notes
- [config/Obsidian/README.md](config/Obsidian/README.md) for the note-taking workflow
- [config/ai/README.md](config/ai/README.md) for optional Ollama and Odysseus setup
- [config/PowerToys/README.md](config/glazewm/README.md) for powertoys setup
- [keybindings.md](keybindings.md) for the canonical default keybinding layout and conflict policy
- [config/WezTerm/README.md](config/WezTerm/README.md) for the optional alternate terminal