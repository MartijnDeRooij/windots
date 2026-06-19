# Flow Launcher

A quick file search and app launcher for Windows with community-made plugins.

`Alt + Space` or `LWin`

<details>

<summary>🪟 <b>Flow Launcher settings work</b></summary>

<br>

This JSON file control the launcher globally.

The main areas to care about are:

### Window and input behavior

These fields define how Flow Launcher opens and behaves.

- `Hotkey`: global shortcut to open the launcher.
- `WindowSize`, `WindowHeightSize`, `ItemHeightSize`: control the launcher dimensions and row spacing.
- `PreviewHotkey`, `AutoCompleteHotkey`, selection keys, and history keys: define navigation.
- `SearchWindowScreen` and `SearchWindowAlign`: decide where the launcher appears.
- `HideWhenDeactivated`, `ShowAtTopmost`, `HideOnStartup`: control visibility behavior.

### Theme and typography

These fields shape the visual style.

- `Theme`
- `ColorScheme`
- `QueryBoxFont`, `ResultFont`, `ResultSubFont`
- `QueryBoxFontSize`, `ResultItemFontSize`, `ResultSubItemFontSize`
- `UseDropShadowEffect`, `UseGlyphIcons`, `UseAnimation`, `UseSound`

Uses Theme `Catppuccin Mocha` with Font `JetBrains Mono`

#### Font Usage

1. Download and install: [JetBrains Mono](https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip) from [Jetbrains](https://www.jetbrains.com/lp/mono/)
2. Unzip the folder
3. Got to Fonts\fonts\ttf and richt click and select install all
4. Open Flow Launcher.
5. Press Ctrl+, to open Settings.
6. Go to Appearance.
7. Look around the theme selector for: A pencil icon top right
8. Select the Font

#### Theme Usage

1. [Download](https://github.com/catppuccin/flow-launcher/tree/main/themes) your preferred flavor from [`themes/`](./themes). 
2. Open Flow Launcher's Settings window, select **Appearance** on the sidebar, and click the "Open Theme Folder" button at the bottom.
3. Move your theme file downloaded in Step 1 to this directory, and restart Flow Launcher.
4. Again in Flow Launcher's Settings window, select **Appearance** on the sidebar, and select your Catppuccin flavor from the list of themes.

### Explorer and browser integrations

These sections define which apps open files and URLs.

- `CustomExplorerList`: Explorer, Total Commander, Directory Opus, Files.
- `CustomExplorerIndex`: which explorer profile is active.
- `CustomBrowserList`: default browser profiles and private browsing flags.
- `CustomBrowserIndex`: which browser profile is active.

This is where you adapt Flow Launcher to your preferred file manager and browser.

### General startup and update behavior

- `StartFlowLauncherOnSystemStartup`
- `UseLogonTaskForStartup`
- `AutoUpdatePlugins`
- `AutoUpdates`
- `ShowUnknownSourceWarning`

### Plugin configuration

The `PluginSettings` block is the most important part after the hotkey.

It contains:

- `PythonExecutablePath`
- `NodeExecutablePath`
- `Plugins`: plugin IDs, names, action keywords, versions, delays, and enable/disable state

</details>

<details>

<summary>🪟 <b>Plugins</b></summary>

<br>

### Plugins:
- [Speed Test](https://github.com/swopnil7/Flow.Launcher.Plugin.SpeedTest) : Test your internet speed from Flow Launcher using the Ookla Speedtest CLI.
- [StringUtils](https://github.com/t-tan/Flow.Launcher.Plugin.StringUtils) : 
    * UUID/GUID generation
    * Random string generation
    * Base64 encoding/decoding
    * URL encoding/decoding
- [Win Hotkey](https://github.com/AminSallah/Flow.Launcher.Plugin.WinHotkey) : This is a simple plugin designed to activate Flow Launcher using the LWin (Left Windows) button instead of the default Alt + Space hotkey.
- [Steam Launcher](https://github.com/hyunwoo312/steam-launcher) : Launch games, search the store, manage friends, switch accounts
- [Audio Device Selector](https://github.com/attilakapostyak/Flow.Launcher.Plugin.AudioDeviceSelector) : A plugin that enables easy selection of the playback device which allows users to easily choose which audio output device they want to use to play audio

### Explorer

General settings:

- Uncheck the 1st and 3rd options
    * Following needs Everything to work
    * Index Search Engine: `Everything`
    * Content Search Engine: `Everything`
    * Directory Recursive Search Engine: `Everything`
- Maximum Results: `100`

Everything settings:

- Check both options

### Plugins Manager

- Check all options

### Program

For better app search quality:

- Index Sources: enable `UWP Apps`, `Start Menu`, `Registry`
- Options: enable `Hide App Path`, `Hide Uninstallers`, `Hide Duplicated Apps`

### Web Searches

- Change Google action keyword from `*` to `gg`
- Max Suggestions: `5`
- Enable `Use Search Query Autocomplete`
- Autocomplete data from: `Google`

### Win Hotkey

- Maximum press time to trigger Flow: leave blank

</details>

<details>
	
<summary>🪟 <b>Plugins Bonus</b></summary>

<br>

### Plugins looked at but not used:
- [Steam Search](https://github.com/Garulf/Steam-Search) : Launch games straight from your launcher
- [AnyVideo Downloader](https://github.com/z1nc0r3/AnyVideo-Downloader-Flow-Plugin) : Plugin for donwloading videos directly from links. 
- [Clipboard+](https://github.com/Jack251970/Flow.Launcher.Plugin.ClipboardPlus) : clipboard manager for windows with support for text, images, and files.
- [Colors](https://github.com/Flow-Launcher/Flow.Launcher.Plugin.Color) : This plugin is for previewing and converting colors between hex, rgb, vec3 and hsl.
- [CurrencyPP](https://github.com/SweedXD/CurrencyPP) : An currency converter
- [DayNight Toggle](https://github.com/jatinderjit/Flow.Launcher.Plugin.DayNightToggle) : plugin to toggle between light and dark mode in Windows 10/11.
- [Emoji+](https://github.com/Garulf/emoji-plus) : Search and copy the right Emoji for any occasion.
- [Env](https://github.com/lurebat/Flow.Launcher.Plugin.Env) : plugin to manage Windows user environment variables directly from the Flow Launcher interface.
- [Google Meet Creator](https://github.com/renzocastillo/Flow.Launcher.Plugin.GoogleMeetCreator) : plugin to quickly create Google Meet meetings.
- [Lorem Ipsum Generator](https://github.com/ansi-sudo/Lorem-Ipsum-Generator) : Generate Lorem Ipsum paragraphs / words / sentences from Flow Launcher.
- [Nicknames Generator](https://github.com/HOK405/Flow.Launcher.Plugin.NicknamesGenerator) : Generate catchy, configurable nicknames
- [Temp Cleaner](https://github.com/NDiiong/Flow.Launcher.Plugin.TempCleaner) : 
- [Uninstaller+](https://github.com/Jack251970/Flow.Launcher.Plugin.UninstallerPlus) : help you uninstall desktop and Microsoft store programs based on [Bulk-Crap-Uninstaller](https://github.com/BCUninstaller/Bulk-Crap-Uninstaller).
- [Windows Services Manager](https://github.com/TBM13/Flow.Launcher.Plugin.WindowsServices) : A Flow Launcher plugin to manage Windows services.
- [Windows Terminal Profiles](https://github.com/zlyfer/FlowLauncher.Plugin.WindowsTerminalProfiles) : A Flow Launcher plugin to quickly search and open Windows Terminal profiles.

For `Temp Cleaner`, if you use Scoop, add `C:\Users\$USER\scoop\cache` to the temp folder list.

## Manual plugin tweaks

### AnyVideo Downloader

- Download path: `%USERPROFILE%\Videos\Downloads`

### Clipboard+

- Action keyword: `cp`
- List max records: `100`
- Uncheck Windows Clipboard-related options
- Check Encrypt data in the database
- Keep text: `1 hour`
- Keep assets: `1 hour`
- Keep files: `1 hour`

### Emoji+

- Action keyword: `:`

### Shell

- Enable only `Always run as administrator`

### Temp Cleaner

Add these directories separated by `;`:

- `%LOCALAPPDATA%\Temp`
- `C:\Windows\Prefetch`
- `%USERPROFILE%\scoop\cache` if you use Scoop

</details>