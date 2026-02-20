# CLAUDE.md

## Environment

- Use `uv run` for all Python commands: `uv run pytest`, `uv run ruff check .`, etc.
- Never edit `pyproject.toml` directly to add dependencies — always use `uv add <package>`

## Code rules

- Max file length: 500 lines. Max function length: 50 lines.
- Always use type hints on function signatures.
- Use double quotes for strings.
- Line length: 100 characters (enforced by ruff).
- Follow vertical slice architecture: tests live next to the code they test.

## Validation commands

```bash
uv run ruff check .
uv run ruff format --check .
uv run mypy .
uv run pytest
```

## Git

- Never commit without being asked.
- Never use `git add .` or `git add -A` — stage specific files.
- Never skip hooks (`--no-verify`).
- Commit message format: `<type>(<scope>): <subject>` — types: feat, fix, docs, refactor, test, chore.
- Do not include "Claude Code" or "written by Claude" in commit messages.

## Behaviour

- When in doubt, ask. Never assume or guess at requirements.
- Do not refactor code that wasn't part of the request.
- Do not add comments unless the logic is non-obvious.
