# Obsidian

[Obsidian](https://obsidian.md/) is a Markdown-based note-taking and knowledge base app.

Obsidian is part of the Windots workflow as a documented, optional note-taking module.
This repo does not track a live Obsidian vault. It documents how to install Obsidian, where to keep the vault, and how to integrate it with the rest of the environment.

## Install

```powershell
winget install Obsidian.Obsidian
```

## Vault location

- `%USERPROFILE%\Documents\Obsidian\Main`

```text
Main/
├─ Templates/
│  ├─ Daily-Note.md
│  └─ Work-Item.md
│
├─ 0-Inbox/
├─ 1-Work-Items/
├─ 2-Reference/
├─ 3-Planning/
│  ├─ Agenda.md
│  └─ ToDo.md
│
├─ 4-Daily/
├─ 5-Notes/
└─ 9-Archive/
```

## What should stay out of this repo

- your real notes
- daily journals
- private vault data
- machine-specific plugin state

## Windots integrations

### GlazeWM

The canonical [GlazeWM config](../glazewm/config.yaml) opens Obsidian through the `obsidian://` URI handler instead of a hardcoded shortcut path.

### Flow Launcher

Use Flow Launcher for quick opening of Obsidian or note-related commands once you choose a plugin or URI workflow you like.

### VS Code

Keep Obsidian as the writing and knowledge-management layer, and keep VS Code as the code and repo-management layer.

Use side-by-side windows when you are capturing decisions about configuration changes.

## Plugins in OBisidan

* Backlinks
* Bookmarks
* Daily Notes
* Outline
* Templates
* Quickadd

## Local AI integration

Obsidian pairs well with local AI tools such as Ollama or Odysseus for:

- summarizing configuration experiments
- keeping implementation notes
- building a private knowledge base around your workstation setup

See [../ai/README.md](../ai/README.md) for the local AI layer.

### Configure Hotkeys

The commands can be assigned from **Settings → Hotkeys**.

```text
Settings → Hotkeys
```

Suggested assignments:

| Hotkey     | Action                  |
| ---------- | ----------------------- |
| Ctrl+Alt+D | Open Today's Daily Note |
| Ctrl+Alt+W | QuickAdd: Work Item     |
| Ctrl+Alt+N | Open Standard Notes     |
| Ctrl+Alt+A | Open Agenda Conflict    |
| Ctrl+Alt+T | Open ToDo               |
| Ctrl+Alt+[ | Previous Daily Note     |
| Ctrl+Alt+] | Next Daily Note         |
| Ctrl+P  | Command Palette |
---

## References

- [Daily Notes – Obsidian Help](https://obsidian.md/help/plugins/daily-notes)
- [Hotkeys – Obsidian Help](https://obsidian.md/help/hotkeys)
- [QuickAdd workflow discussion (Reddit)](https://www.reddit.com/r/ObsidianMD/comments/16uke91/tips_utilizing_quickadd_plugin_to_open_specific/)
