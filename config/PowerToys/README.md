# [PowerToys](https://learn.microsoft.com/en-us/windows/powertoys/)
PowerToys is a collection of utilities that help customize Windows and streamline everyday tasks. 

## Windowing and Layouts

In case of using GlazeWM these two can be disabled.

### [FancyZones](https://learn.microsoft.com/en-us/windows/powertoys/fancyzones)
FancyZones is a powerful window manager utility in PowerToys that helps you arrange and snap windows into custom layouts for improved productivity and workflow efficiency. 

### [Workspaces](https://learn.microsoft.com/en-us/windows/powertoys/workspaces)
PowerToys Workspaces is a desktop manager utility that helps you launch applications to custom positions and configurations with a single click. This Windows desktop management tool gets you into your ideal desktop state for any project or activity faster. You can capture your desktop state as a new workspace using the editor, add arguments to apps to configure their state on launch, and pin the workspace as a desktop shortcut for quick-launching.

## Input and Output

### [Keyboard Manager utility](https://learn.microsoft.com/en-us/windows/powertoys/keyboard-manager)
The PowerToys Keyboard Manager enables you to remap keys and shortcuts on your keyboard for enhanced productivity.

## File Management

### [File Explorer add-ons utility](https://learn.microsoft.com/en-us/windows/powertoys/file-explorer)
PowerToys File Explorer add-ons enhance Windows File Explorer with preview pane and thumbnail support for multiple file types including SVG, PDF, Markdown, and source code files. These utilities allow you to preview file contents directly in File Explorer without opening separate applications.

### [File Locksmith utility](https://learn.microsoft.com/en-us/windows/powertoys/file-locksmith)
File Locksmith is a PowerToys utility that helps you identify which processes are using specific files or directories in Windows. This shell extension allows you to easily unlock files that are being used by other processes, making file management more efficient.

## Advanced

### [Command Not Found](https://learn.microsoft.com/en-us/windows/powertoys/cmd-not-found)
The PowerToys Command Not Found utility is a PowerShell 7 module that detects command-line errors and suggests relevant WinGet packages to install.

To satisfy the PowerToys Command Not Found prerequisites manually, you need:

#### Install/upgrade PowerShell 7
```bash
winget install --id Microsoft.PowerShell --source winget
```

#### Install the WinGet PowerShell module
```bash
pwsh -NoProfile -Command "Install-PSResource Microsoft.WinGet.Client -TrustRepository"
```

#### Enable required features
```bash
pwsh -NoProfile -Command "Enable-ExperimentalFeature PSFeedbackProvider"
pwsh -NoProfile -Command "Enable-ExperimentalFeature PSCommandNotFoundSuggestion"
```

#### Verify everything

```bash
$PSVersionTable.PSVersion

Get-Module Microsoft.WinGet.Client -ListAvailable

Get-ExperimentalFeature PSFeedbackProvider,PSCommandNotFoundSuggestion
```

### [Environment Variables](https://learn.microsoft.com/en-us/windows/powertoys/environment-variables)
PowerToys Environment Variables offers an easy and convenient way to manage Windows environment variables. This utility allows you to create profiles for managing a set of variables together, streamlining your development workflow. Profile variables have precedence over User and System variables.