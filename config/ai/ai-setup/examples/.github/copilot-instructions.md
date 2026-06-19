# Project general coding guidelines

Use these rules as the default behavior for GitHub Copilot in this repository.

## General rules

- Prefer small, reviewable changes over large rewrites.
- Preserve existing project structure and naming conventions.
- Fix root causes when practical instead of patching symptoms.
- Do not modify unrelated files just because they are nearby.

## Code quality

- Keep functions focused and cohesive.
- Add tests for behavior changes when the project already has a test suite.
- Prefer explicit error handling over silent failure.
- Match the formatting and style already used by the project.

## Reviews and planning

- For reviews, list findings first and keep the summary short.
- For non-trivial tasks, create a short plan before editing code.
- Call out assumptions when requirements are incomplete.

## Safety

- Avoid destructive commands unless explicitly requested.
- Do not expose secrets, tokens, or credentials.
- Confirm risky file operations before suggesting them.