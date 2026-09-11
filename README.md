# yugo-stack

Personal Cursor plugin.

## Install

```bash
git clone https://github.com/Spice-Z/yugo-stack.git ~/.cursor/plugins/local/yugo-stack
```

Reload Cursor (`Developer: Reload Window`).

On another machine, run the same clone. To update:

```bash
git -C ~/.cursor/plugins/local/yugo-stack pull
```

Then reload again.

## Skills

| Skill | What it does |
| --- | --- |
| `/so` | Simplifies the last chat and explains it with minimal bullet points |
| `/how` | Investigates how a backend or mobile feature works and generates diagrams |

## Add a skill

```text
skills/<name>/SKILL.md
```

Keep `name` in the frontmatter identical to the folder name.
