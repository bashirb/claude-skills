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
/plugin install bashir-skills@bashirb-claude-skills
```

### Install a single skill manually

Copy a skill directory into one of these locations:

| Location | Path | Scope |
|---|---|---|
| Personal | `~/.claude/skills/<skill-name>/` | All your projects |
| Project | `.claude/skills/<skill-name>/` | Current project only |

Example — install `pr-review` for all your projects:

```bash
cp -r skills/pr-review ~/.claude/skills/
```

### Invoke a skill

Once installed, invoke it directly in Claude Code:

```
/pr-review
```

Claude will also auto-invoke skills when the task matches the description.

## Skills in this repo

| Skill | Description |
|---|---|
| [pr-review](./skills/pr-review/) | Review a pull request for correctness, clarity, and potential issues |

## Creating a skill

Use the [template](./template/SKILL.md) as a starting point.

Key rules:
- `name` must be lowercase, hyphen-separated, and match the directory name
- `description` is the trigger — write it so Claude knows when to activate it
- Keep `SKILL.md` under 500 lines; move large reference material into `references/`
- No README inside skill folders — only what Claude needs to do the job

See Anthropic's [agent skills spec](https://github.com/anthropics/skills/blob/main/spec/agent-skills-spec.md) for the full specification.

## Contributing

1. Fork this repo
2. Copy `template/SKILL.md` into a new `skills/<your-skill-name>/` directory
3. Fill in the frontmatter and instructions
4. Open a PR with a short description of what the skill does and why it's useful
