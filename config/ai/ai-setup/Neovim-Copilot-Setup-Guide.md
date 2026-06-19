# GitHub Copilot Setup Guide for Neovim

This guide shows how to build a practical GitHub Copilot workflow in Neovim that mirrors the intent of VS Code agents, even though Neovim does not provide the same native custom agent UX.

## Important Difference from VS Code

VS Code has first-class custom agents with `.agent.md` files, agent pickers, handoffs, and deep IDE integration.

Neovim does not currently provide the same built-in custom agent system. The closest practical setup is:

- GitHub Copilot for inline suggestions
- CopilotChat.nvim for chat, tools, prompts, and model selection
- project instruction files in the repository
- reusable custom prompts that act like lightweight agents

So the goal in Neovim is not exact parity. The goal is equivalent workflow.

## Initial Reading

Read these before setting up Neovim:

- GitHub Copilot for Neovim overview: https://github.com/github/copilot.vim
- CopilotChat.nvim: https://github.com/CopilotC-Nvim/CopilotChat.nvim
- CopilotChat documentation: https://copilotc-nvim.github.io/CopilotChat.nvim/

Key Neovim concepts:

- `#resource` syntax adds files, diffs, URLs, or selections to the chat context.
- `@copilot` enables tool use with your approval.
- `/PromptName` runs a saved prompt template.
- sticky prompts let you persist project instructions for the current session.

## Requirements

You need at least:

- Neovim 0.10 or newer
- `git`
- `curl`
- `ripgrep` for faster workspace search
- a GitHub account with Copilot enabled
- a plugin manager such as `lazy.nvim`

Optional but useful:

- `tiktoken_core` for better token counting
- `fzf-lua` or Telescope for a better picker UI

## Recommended Plugin Stack

Use these plugins:

- `github/copilot.vim` for inline completion
- `CopilotC-Nvim/CopilotChat.nvim` for chat and tool-assisted editing
- `nvim-lua/plenary.nvim` as a dependency

This repository includes a ready-to-adapt example at `Setup/examples/neovim/lua/plugins/copilot-chat.lua`.

## Example Installation with lazy.nvim

Put a plugin file under your Neovim configuration, for example:

```text
~/.config/nvim/lua/plugins/copilot-chat.lua
```

Then adapt the example file from this repository.

The example setup does four important things:

- enables Copilot inline completions
- configures CopilotChat
- adds project-specific prompts that behave like review and planning agents
- adds keymaps for the most common actions

## Suggested Project Layout

Even in Neovim, keep project conventions inside the repository:

```text
my-project/
|- .github/
|  |- copilot-instructions.md
|- docs/
|- src/
```

You can keep the same `.github/copilot-instructions.md` file used by VS Code. In Neovim, include it manually in chat context with a sticky prompt or by referencing the file.

Example patterns:

```text
#file:.github/copilot-instructions.md
#gitdiff:staged
#buffer
```

## How to Emulate Agents in Neovim

In VS Code, you would switch agents from a dropdown.

In Neovim, use named prompts as agent equivalents:

- `ProjectReview`: review current code or diff with findings first
- `ProjectPlan`: create a step-by-step implementation plan
- `ProjectImplement`: implement a task carefully using project rules
- `ProjectTDD`: enforce red-green-refactor behavior

This approach is simpler than VS Code custom agents, but it works well in practice.

## Example Workflow

### Review current changes

Open CopilotChat and ask:

```text
/ProjectReview #gitdiff:staged
```

### Create a plan

```text
/ProjectPlan #file:.github/copilot-instructions.md #buffer
```

### Implement with project rules loaded

```text
/ProjectImplement #file:.github/copilot-instructions.md #gitdiff:staged
```

### TDD-style prompt

```text
/ProjectTDD #file:.github/copilot-instructions.md
```

## Useful Commands

Common CopilotChat commands:

- `:CopilotChat`
- `:CopilotChatOpen`
- `:CopilotChatToggle`
- `:CopilotChatPrompts`
- `:CopilotChatModels`
- `:CopilotChatReset`

Useful prompt ingredients:

- `#file:path/to/file`
- `#buffer`
- `#selection`
- `#gitdiff:staged`
- `#grep:pattern`
- `#url:https://...`
- `@copilot`

## Suggested Keymaps

The exact bindings are up to you, but these are practical defaults:

- `<leader>aa`: toggle CopilotChat
- `<leader>ap`: open prompts picker
- `<leader>am`: open model picker
- `<leader>ar`: run review prompt
- `<leader>ai`: ask implementation question

The provided example configuration wires several of these already.

## Tips and Tricks

- Disable Copilot's default Tab mapping if it conflicts with completion plugins.
- Keep project instructions in one file and explicitly attach them when needed.
- Use `#gitdiff:staged` for code review and commit preparation.
- Use prompt templates instead of retyping review and planning instructions.
- Keep Neovim prompts narrower than VS Code agents because the workflow is less orchestrated.
- Prefer explicit context attachments over huge chat histories.

## Limitations Compared with VS Code

Neovim currently does not give you:

- native `.agent.md` support
- a built-in agent picker with handoffs
- VS Code-style Plan and Agent modes
- the same workspace customization discovery model

What you do get is still useful:

- inline completions
- structured prompt templates
- tool-assisted chat with approval
- reusable project-level instruction files

## Recommended Setup Pattern

If you use both editors, keep one shared source of truth for project rules:

1. Store project rules in `.github/copilot-instructions.md`.
2. Use native custom agents in VS Code.
3. Use prompt templates in Neovim that always attach the same instruction file.
4. Keep review, plan, and implementation prompts named consistently across both editors.

## Troubleshooting

If the Neovim setup does not work:

1. Confirm Copilot is enabled on your GitHub account.
2. Confirm `copilot.vim` authentication completed successfully.
3. Confirm `CopilotChat.nvim` dependencies are installed.
4. Confirm `curl` and `git` are available in your shell.
5. If tool calls or selectors behave poorly, add a better picker such as Telescope or `fzf-lua`.

## Files to Reuse from This Repository

Start with:

- `Setup/examples/neovim/lua/plugins/copilot-chat.lua`
- `Setup/examples/vscode/.github/copilot-instructions.md`

The first gives you the Neovim plumbing. The second gives you a shared project instruction file you can use in both editors.