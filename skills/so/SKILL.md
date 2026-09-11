---
name: so
description: >-
  Simplifies the last chat and explains it with minimal bullet points.
  Use only when the user invokes /so.
disable-model-invocation: true
---

# so

Simplify last chat and explain it with minimal bullet points.

## Which chat

1. If this conversation already has real work before `/so`, that is the chat. Use the current thread. Do not open transcripts.
2. If this conversation is only `/so` (or the same ask with no prior work), summarize the **most recent other chat**:
   - Find the newest `*.jsonl` under `~/.cursor/projects/*/agent-transcripts/`.
   - Skip the current conversation if you can identify it.
   - Read user turns and final assistant conclusions. Skip tool traces.
3. If the user names a chat, use that one instead.

## Write

- Outcome first, not process.
- Decisions, changes, and leftovers only.
- No preamble, no heading, no recap of the recap.
- No tool names, file dumps, or play-by-play.

## Shape

3–6 bullets. Never more than 7.

```
- what we were doing (1 line)
- what changed or was decided
- what is still open (omit if nothing)
```

Drop any of those lines if they add nothing.

## Example

```
- Set up yugo-stack as a public single-plugin repo
- First skill is /so: recap the last chat in a few bullets
- Next: commit, push, clone into ~/.cursor/plugins/local
```
