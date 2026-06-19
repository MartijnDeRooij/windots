# Obsidian Setup Guide

This guide walks through creating the recommended Windots Obsidian vault structure from a fresh installation.

## 1. Install Obsidian

Install using Winget:

```powershell
winget install Obsidian.Obsidian
```

Launch Obsidian after installation completes.

---

## 2. Create a Vault

On first launch:

1. Click **Create new vault**
2. Name it:

```text
Main
```

3. Choose a location:

```text
%USERPROFILE%\Documents\Obsidian
```

4. Click **Create**

Result:

```text
Documents/
└─ Obsidian/
   └─ Main/
```

---

## 3. Create the Folder Structure

Inside the vault create the following folders and files

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
└─ 9-Archive/
```

Purpose of each folder:

| Folder       | Purpose                              |
| -----------  | ------------------------------------ |
| 0-Inbox      | Quick capture and temporary notes    |
| 1-Work-Items | Active work and personal projects    |
| 2-Reference  | Documentation and reference material |
| 3-Planning   | Agendas, goals, and task lists       |
| 4-Daily      | Daily notes                          |
| 9-Archive    | Completed or inactive content        |
| Template    | Templates for standard markdown files |

---

## 4. Enable Core Plugins

Open:

```text
Settings → Core Plugins
```

Enable:

* Backlinks
* Bookmarks
* Daily Notes
* Outline
* Templates

These provide most of the functionality needed without additional plugins.

---

## 5. Configure Daily Notes

Open:

```text
Settings → Daily Notes
```

Set:

```text
New file location:
4-Daily
```

Filename format:

```text
YYYY-MM-DD
```

Example:

```text
4-Daily/2026-06-17.md
```

---

## 6. Create a Templates Folder

Create:

```text
Templates/
```

Result:

```text
Main/
├─ Templates/
├─ 0-Inbox/
├─ 1-Work-Items/
├─ 2-Reference/
├─ 3-Planning/
├─ 4-Daily/
└─ 9-Archive/
```

Open:

```text
Settings → Templates
```

Set:

```text
Template folder location:
Templates
```

---

## 7. Create a Daily Note Template

Create:

```text
Templates/Daily-Note.md
```

Contents:

```markdown
# {{date:YYYY-MM-DD}}

## Agenda

## Work Items

## Notes

## Tasks

- [ ]
```

Return to:

```text
Settings → Daily Notes
```

Set:

```text
Template file location:
Templates/Daily-Note
```

Every new daily note will now use this template.

Test it by pressing 
```markdown
Ctrl + P
Daily Notes: Open today's daily note
```
---

## 8. Create Planning Notes

Create:

```text
3-Planning/Agenda.md
```

```markdown
# Agenda

## Today

## This Week

## Waiting For

## Upcoming Meetings
```

Create:

```text
3-Planning/ToDo.md
```

```markdown
# Tasks

## Today

- [ ]

## Next

- [ ]

## Someday

- [ ]
```

---

## 9. Install QuickAdd (Optional)

Open:

```text
Settings → Community Plugins
```

1. Disable Safe Mode
2. Browse Plugins
3. Search for:

```text
QuickAdd
```

4. Install
5. Enable

QuickAdd makes it possible to create notes and templates from keyboard shortcuts.

---

## 10. Create a Work Item Template

Create:

```text
Templates/Work-Item.md
```

```markdown
# Work Item - {{DATE:YYYY-MM-DD HH:mm}}

## Objective

## Notes

## Actions

- [ ]

## Outcome
```

---

## 11. Configure QuickAdd

Open:

```text
Settings → QuickAdd
```

Create a new:

```text
Capture Choice
```

Name: Configure Capture

You will see:
```text
Capture to (Vault relative path)
```
Set it to make the name what you give it as input and place it in the correct location:
```text
1-Work-Items/{{VALUE}}.md
```

Template:

```text
Templates/Work-Item.md
```

This allows new work-item notes to be created in seconds.

---