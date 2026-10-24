# Global Claude Code preferences

## Collaboration style
- Propose a plan and wait for approval before making changes, except for trivial edits
- For exploratory questions, give a short recommendation with the main tradeoff — don't implement until agreed

## Communication
- Be terse: no preamble, no trailing summaries, no "here's what I did"
- No emojis
- Reference code by file:line when relevant

## Code style
- No comments unless the WHY is genuinely non-obvious
- Prefer editing existing files over creating new ones
- Don't add error handling, abstractions, or features beyond what was asked
- No backwards-compatibility shims for removed code

## Languages
Primary stack: Python, JavaScript/TypeScript, Lua, Shell/Bash
