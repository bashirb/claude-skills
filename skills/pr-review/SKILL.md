---
name: pr-review
description: Review a pull request for correctness, clarity, and maintainability. Use this skill when asked to review a PR, look at someone's diff, check code changes, or give feedback on a pull request.
---

# PR Review

Review the provided pull request diff or branch. Your job is to give honest, useful feedback — not just surface-level style notes.

## What to look for

**Correctness**
- Logic errors, off-by-one errors, incorrect assumptions
- Edge cases the code doesn't handle
- Race conditions or concurrency issues where relevant

**Clarity**
- Variable and function names that don't reflect what they do
- Code that requires a comment to understand but has none
- Abstractions that add complexity without adding value

**Maintainability**
- Changes that break existing tests or lack test coverage for new behavior
- Hard-coded values that should be configurable
- Duplication that could be a source of bugs later

**Security** (flag only real concerns, not theoretical ones)
- Unvalidated user input reaching sensitive operations
- Secrets or credentials in code

## How to structure feedback

Group feedback by file. For each file, use this format:

**[Severity]** `path/to/file.ext:line` — Description of the issue, and if non-obvious, why it matters.

Severity levels:
- **Blocker** — Must fix before merging (correctness, security)
- **Suggestion** — Worth changing but won't block a merge
- **Nit** — Minor style or preference; prefix with "Nit:"

End with a short summary: overall assessment, the most important thing to address, and whether you'd approve as-is or request changes.

## What not to do

- Don't flag issues already acknowledged in the PR description
- Don't suggest refactoring code that wasn't touched in this PR
- Don't comment on style if a linter enforces it
- Don't pad the review with praise to soften feedback
