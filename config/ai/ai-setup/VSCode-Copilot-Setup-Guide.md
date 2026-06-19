# GitHub Copilot Setup Guide for VS Code

This guide shows how to turn a normal repository into a Copilot-friendly project with instructions, custom agents, and practical day-to-day workflows.

## Initial Reading

Start here before you customize anything:

- VS Code agents overview: https://code.visualstudio.com/docs/copilot/agents/overview
- VS Code custom agents: https://code.visualstudio.com/docs/copilot/customization/custom-agents
- VS Code smart actions: https://code.visualstudio.com/docs/copilot/copilot-smart-actions
- VS Code command-line chat entry points: https://code.visualstudio.com/docs/configure/command-line#_start-chat-from-the-command-line

Read these topics in this order:

1. Learn the difference between Ask, Plan, and Agent.
2. Learn where `.github/copilot-instructions.md` and `.github/agents/*.agent.md` live.
3. Learn which actions are built into the editor so you do not over-prompt for common tasks.

## What This Setup Gives You

With a small amount of structure, Copilot becomes more consistent across the project:

- Project coding rules live in `.github/copilot-instructions.md`.
- Custom roles live in `.github/agents/*.agent.md`.
- Team members get the same agent names and the same starting behavior.
- Planning, reviewing, and implementation can be split into repeatable workflows.

## Suggested Project Layout

Use this structure in a project root:

```text
my-project/
|- .github/
|  |- copilot-instructions.md
|  |- agents/
|  |  |- reviewer.agent.md
|  |  |- tdd.agent.md
|  |- instructions/
|  |  |- style.instructions.md
|  |- prompts/
|     |- review.prompt.md
|- .vscode/
|  |- settings.json
|- src/
```

Use each part for a different job:

- `.github/copilot-instructions.md`: persistent project rules and expectations.
- `.github/agents/*.agent.md`: reusable personas with tool restrictions and handoffs.
- `.github/instructions/*.instructions.md`: targeted rules for specific file patterns or languages.
- `.github/prompts/*.prompt.md`: one-off reusable prompts.
- `.vscode/settings.json`: team defaults for Copilot behavior in VS Code.

## VS Code Settings

Some Copilot features are controlled by user settings, some by workspace settings, and some by organization policy. If a setting appears ignored, check whether your organization manages it.

Recommended settings to review:

- `github.copilot.enable`
- `chat.agent.enabled`
- `chat.generalPurposeAgent.enabled`
- `chat.subagents.allowInvocationsFromSubagents`
- `github.copilot.chat.organizationCustomAgents.enabled`
- `github.copilot.chat.cli.customAgents.enabled`
- `telemetry.telemetryLevel`
- `chat.disableAIFeatures`

Example workspace settings:

```json
{
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "markdown": true,
    "scminput": false
  },
  "chat.subagents.allowInvocationsFromSubagents": true,
  "github.copilot.chat.organizationCustomAgents.enabled": true,
  "github.copilot.chat.cli.customAgents.enabled": true,
  "telemetry.telemetryLevel": "off"
}
```

Notes:

- `chat.agent.enabled` can be organization-managed.
- `chat.disableAIFeatures` disables Copilot features and should normally remain `false` or unset.
- Experimental settings may change name across releases.

The example file in this repository is at `Setup/examples/vscode/.vscode/settings.json`.

## Shortcuts and Useful Entry Points

Keyboard shortcuts vary by platform and keymap, so verify them in the Keyboard Shortcuts editor.

Useful defaults and common entry points:

- `Ctrl+Shift+P`: open the Command Palette.
- `Ctrl+I`: open Inline Chat in the editor.
- Chat view: switch between Ask, Plan, Agent, and any custom agents from the agent picker.
- `/agents`: open custom agent management.
- `/create-agent`: generate a new custom agent with AI.
- `Chat: New Chat`: start a fresh session.
- `Chat: Open Chat Customizations`: inspect agents, prompt files, and instructions.
- `Chat: New Copilot CLI Command`: hand off work to Copilot CLI.

If your current keymap binds `Ctrl+Shift+I` to a chat or agent action, keep using it, but confirm the binding because this can vary by extension version and OS.

## Easy Prompts and Commands to Teach a Team

These are the fastest high-value examples to share with a team:

- `/plan`: create a structured implementation plan before changing code.
- `Review my changes`: ask for a review of the current diff.
- `Review my full project`: ask for a broader architectural review.
- `Generate release notes based on #changes`: summarize repository changes.
- `Create a complete task manager web application...`: good feature implementation prompt template.
- `Add the option to completely hide completed items with a toggle`: good follow-up enhancement prompt.

Good patterns:

1. Start with Plan when the task is not trivial.
2. Switch to Agent only after the plan looks correct.
3. Use Ask for explanation and exploration only.

## Day-to-Day Workflow

### 1. Start clean

Before large agent work, commit or stash unrelated changes so the session is easier to review.

### 2. Open a new local agent session

In the Chat view:

1. Create a new chat.
2. Choose `Plan` from the agents dropdown.
3. Describe the task.
4. Refine the plan if Copilot asks follow-up questions.
5. Hand off to `Agent` or continue in Copilot CLI when the plan is ready.

### 3. Use the right agent type

- Local agent: interactive work in your editor with tools and workspace context.
- Copilot CLI: autonomous background work on your machine.
- Cloud agent: remote execution and GitHub-centric collaboration.
- Third-party agent: when you specifically want another provider.

## Example: Project Instructions

Your project instructions should stay short and stable. Put coding standards, architecture boundaries, testing expectations, and review expectations there.

A concrete example is available at `Setup/examples/vscode/.github/copilot-instructions.md`.

Good content for this file:

- branch and commit naming conventions
- testing expectations
- framework-specific rules
- review checklist items
- architecture boundaries that Copilot should not cross

Avoid putting volatile details there, such as sprint-specific tasks or temporary experiments.

## Example: Creating Custom Agents

Custom agents are Markdown files with a `.agent.md` extension in `.github/agents`.

Use them when you want:

- a stable role such as reviewer, planner, or release writer
- limited tool access for safer behavior
- handoffs between stages such as planning to implementation
- repeatable prompts for a team

This repository includes two examples:

- `Setup/examples/vscode/.github/agents/reviewer.agent.md`
- `Setup/examples/vscode/.github/agents/tdd.agent.md`

### Reviewer agent example

Use a reviewer agent when you want findings first and no direct code changes.

### TDD agent example

Use a TDD agent when you want a red-green-refactor workflow and handoff from tests to implementation.

## How to Set Up the Example Agents

1. Create a `.github/agents` folder in the project root.
2. Copy the example `.agent.md` files into that folder.
3. Open the Chat view in VS Code.
4. Run `/agents` or open Chat Customizations.
5. Confirm the agents are detected.
6. Select the agent from the agents dropdown.

If the agent does not appear:

- verify the file lives under `.github/agents`
- verify the file ends with `.agent.md`
- verify the frontmatter is valid YAML
- open Chat diagnostics from the Chat view and inspect errors

## Smart Actions Worth Teaching

These actions reduce prompt writing:

- Generate commit messages from Source Control.
- Generate docs from code selections.
- Generate tests from implementation code.
- Explain selected code.
- Fix code from error code actions.
- Review selected code.
- Fix test failures from the Test Explorer.
- Use semantic search in the Search view.

## Tips and Tricks

- Keep instructions short. Long instruction files dilute context quality.
- Prefer one agent per role instead of one giant agent that does everything.
- Restrict tools for review and planning agents so they do not edit by accident.
- Store team agents in the repository and personal agents in your user profile.
- Use handoffs to move from planning to implementation instead of rewriting context.
- For monorepos, enable discovery from the parent repository if needed.
- If a setting seems unavailable, check whether it is preview-only or organization-managed.

## Troubleshooting

If Copilot or agents do not behave as expected:

1. Confirm you are signed in and your GitHub Copilot license is active.
2. Check whether your organization disables agents.
3. Open Chat diagnostics and confirm customizations loaded successfully.
4. Verify your `.agent.md` frontmatter and file location.
5. Reduce the scope of your instructions if responses become generic or unstable.

## Recommended Starting Point for a New Project

Copy these files first:

- `Setup/examples/vscode/.github/copilot-instructions.md`
- `Setup/examples/vscode/.github/agents/reviewer.agent.md`
- `Setup/examples/vscode/.github/agents/tdd.agent.md`
- `Setup/examples/vscode/.vscode/settings.json`

Then adapt the instructions and agent descriptions to your own stack.