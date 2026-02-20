# claude-skills

A collection of skills for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Skills are folders of instructions and resources that Claude loads dynamically to improve performance on specific tasks.

## What is a skill?

A skill is a directory containing a `SKILL.md` file. Claude loads the skill's instructions when the task matches its description — either automatically or when you invoke it with `/skill-name`.

```
my-skill/
├── SKILL.md          # Required. Instructions + frontmatter metadata.
├── references/       # Optional. Detailed docs loaded on demand.
├── scripts/          # Optional. Helper scripts Claude can run.
└── assets/           # Optional. Templates, fonts, or other static files.
```

## Repo structure

```
claude-skills/
├── .claude/
│   ├── agents/       # Subagents Claude can spawn
│   ├── skills/       # Invocable skills
│   └── settings.local.json
├── .claude-plugin/
│   └── marketplace.json
└── template/         # Starter template for new skills
```

The `.claude/` folder mirrors the directory structure Claude Code uses locally. To manually install everything, copy it into your project root or `~/`.

The `SKILL.md` file uses YAML frontmatter:

```markdown
---
name: my-skill
description: What this skill does and when Claude should use it.
---

# Instructions go here
```

## Using a skill

### Install via Claude Code plugin (recommended)

Register this repo as a plugin marketplace, then install:

```
/plugin marketplace add bashirb/claude-skills
```

Then browse and install from the menu, or install directly:

```
/plugin install bashirb-skills@bashirb-claude-skills
```

### Install manually

Copy the `.claude/` folder into your project root (project scope) or `~/` (user scope):

```bash
# Project scope — available in this repo only
cp -r .claude/agents .claude/skills /your-project/.claude/

# User scope — available across all your projects
cp -r .claude/agents ~/.claude/
cp -r .claude/skills ~/.claude/
```

Or install a single skill:

```bash
cp -r .claude/skills/pr-review ~/.claude/skills/
```

### Invoke a skill

Once installed, invoke it directly in Claude Code:

```
/pr-review
```

Claude will also auto-invoke skills when the task matches the description.

### Invoke an agent

Agents are not slash commands — they are subagents Claude spawns on your behalf. Two ways to use them:

**By name** — just describe what you want and Claude will pick the right agent:

```
Review src/auth.ts for security issues
```

**By explicit reference** — mention the agent file directly to be specific:

```
@.claude/agents/code-reviewer.md review this file
```

## Skills in this repo

| Skill | Description |
|---|---|
| [pr-review](./.claude/skills/pr-review/) | Review a pull request for correctness, clarity, and potential issues |

## Agents in this repo

| Agent | Description |
|---|---|
| [code-reviewer](./.claude/agents/code-reviewer.md) | Reviews code for correctness, security, and maintainability |
| [documentation-manager](./.claude/agents/documentation-manager.md) | Keeps documentation in sync with code changes |
| [validation-agent](./.claude/agents/validation-agent.md) | Runs tests and validation gates, iterates until all pass |

## Creating a skill

Use the [template](./template/SKILL.md) as a starting point.

Key rules:
- `name` must be lowercase, hyphen-separated, and match the directory name
- `description` is the trigger — write it so Claude knows when to activate it
- Keep `SKILL.md` under 500 lines; move large reference material into `references/`
- No README inside skill folders — only what Claude needs to do the job

See Anthropic's [agent skills spec](https://github.com/anthropics/skills/blob/main/spec/agent-skills-spec.md) for the full specification.

## Plugin command reference

**Marketplace**

```
# Add
/plugin marketplace add bashirb/claude-skills            # from GitHub
/plugin marketplace add https://gitlab.com/org/repo.git  # from other git host
/plugin marketplace add ./local/path                     # from local directory

# Update / Remove
/plugin marketplace update bashirb-claude-skills
/plugin marketplace remove bashirb-claude-skills
/plugin marketplace list
```

**Install plugins**

```
# Interactive (lets you choose scope)
/plugin

# Direct install — defaults to user scope
/plugin install bashirb-skills@bashirb-claude-skills

# Explicit scope via terminal
claude plugin install bashirb-skills@bashirb-claude-skills --scope user
claude plugin install bashirb-skills@bashirb-claude-skills --scope project
claude plugin install bashirb-skills@bashirb-claude-skills --scope local
```

**Uninstall / Disable**

```
/plugin uninstall bashirb-skills@bashirb-claude-skills
/plugin disable bashirb-skills@bashirb-claude-skills
/plugin enable bashirb-skills@bashirb-claude-skills

# Scope-specific uninstall via terminal
claude plugin uninstall bashirb-skills@bashirb-claude-skills --scope user
claude plugin uninstall bashirb-skills@bashirb-claude-skills --scope local
claude plugin uninstall bashirb-skills@bashirb-claude-skills --scope project
```

**Scopes**

| Scope | Who | Shared via git | Use case |
|---|---|---|---|
| `user` | You, all projects | No | Personal tools across all your work |
| `project` | Everyone on the repo | Yes (`.claude/settings.json`) | Team-wide plugins |
| `local` | You, this repo only | No | Personal override for one repo |

**Nuclear option if things get broken**

```bash
rm -rf ~/.claude/plugins/cache
```

Then reinstall via `/plugin install`.

## Contributing

1. Fork this repo
2. For a new skill: copy `template/SKILL.md` into `.claude/skills/<your-skill-name>/`
3. For a new agent: create `.claude/agents/<your-agent-name>.md`
4. Fill in the frontmatter and instructions
5. Open a PR with a short description of what it does and why it's useful
