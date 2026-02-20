# CLAUDE.md

This repo contains reusable Claude Code skills and agents.

## Structure

```
.claude/
├── agents/   # Subagent .md files
└── skills/   # Skill directories, each with a SKILL.md
.claude-plugin/
└── marketplace.json
```

## Adding an agent

1. Create `.claude/agents/<name>.md` with YAML frontmatter:
   ```markdown
   ---
   name: agent-name
   description: "When to use this agent. Be specific."
   tools: Read, Edit, Bash, ...
   ---
   ```
2. Add the path to `agents` array in `.claude-plugin/marketplace.json`

## Adding a skill

1. Create `.claude/skills/<name>/SKILL.md` with YAML frontmatter:
   ```markdown
   ---
   name: skill-name
   description: "When to use this skill."
   ---
   ```
2. Add the path to `skills` array in `.claude-plugin/marketplace.json`

## Rules

- Agent `description` is what Claude uses to decide when to invoke it — write it precisely
- Keep agent prompts focused; avoid generic advice that applies to everything
- Don't add a README inside skill folders — only what Claude needs to do the job
