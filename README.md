# yugo-stack

Personal Cursor plugin.

## Install

```bash
git clone https://github.com/Spice-Z/yugo-stack.git ~/.cursor/plugins/local/yugo-stack
~/.cursor/plugins/local/yugo-stack/setup.sh
```

Reload Cursor (`Developer: Reload Window`).

`setup.sh` copies each skill as real files into your Cursor user Agent Store. Cloud Agents only see those copies — they do not follow `~/.cursor/skills` symlinks.

On another machine, run the same clone and `setup.sh`. To update, run `/up-yugo` or:

```bash
git -C ~/.cursor/plugins/local/yugo-stack pull
~/.cursor/plugins/local/yugo-stack/setup.sh
```

Then reload again.

## Skills

| Skill | What it does |
| --- | --- |
| `/so` | Simplifies the last message and explains it with minimal bullet points |
| `/restate` | Restates the last user message in the agent's own words |
| `/japa` | Explains the same thing as the last chat, in Japanese |
| `/intern` | Explains the same thing as the last chat, as you do for intern |
| `/how` | Investigates how a backend or mobile feature works and generates diagrams |
| `/handbook` | Researches a question and writes a Notion handbook (index + section pages) |
| `/up-yugo` | Pulls `~/.cursor/plugins/local/yugo-stack` so this machine gets the latest skills |

## Add a skill

```text
skills/<name>/SKILL.md
```

Keep `name` in the frontmatter identical to the folder name.
