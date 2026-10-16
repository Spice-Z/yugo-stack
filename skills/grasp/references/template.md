# Output template

Copy this structure exactly. Replace everything in `<angle brackets>`. Remove optional blocks marked `(optional)` when they do not apply. Keep the order. The order is the layering: the reader reads the top and opens the rest only if needed.

Use `(1)`, `(2)`, `(3)` for part numbers everywhere, so they work in any renderer.

---

```markdown
<repo>#<number> · <area, e.g. Admin frontend / Backend / Full stack> · <N> files, +<adds> −<dels> · <issue id if any>

## About: <feature name>

<What the feature is, who uses it, and how it normally works. 3 sentences or fewer. Focus on the behavior this PR changes.>

<!-- (optional) skip when the feature needs no explanation -->
<details>
<summary><b>Key terms</b></summary>

| Term | Meaning |
|---|---|
| <term> | <one-line meaning> |
| <term> | <one-line meaning> |

</details>

## Change: <Hook: 8 words or fewer>

<Plain summary: one or two short sentences. What was true before, what is true now.>

<!-- (optional) only when the PR is part of a stack or series -->
**Stack:** 1 · <title> → 2 · <title> → **3 · <title> (this PR)** → 4 · <title>

| Stop | Here | Changed |
|---|---|---|
| Who | <role> | <part numbers or —> |
| Screen | <screen, user's words> | <part numbers or —> |
| Endpoint | <endpoint / job / entry point> | <part numbers or —> |
| Logic | <rule or behavior> | <part numbers or —> |
| Data | <what is stored or read> | <part numbers or —> |

<!-- (optional) skip when the PR has only one part -->
**Parts**
- (1) <one line>
- (2) <one line>
- (3) <one line>

**Live for users today:** <Yes / No / Partly>. <Who is affected now: which users or customers, which flag, which deploy. Name any part that runs outside the flag.>

<details>
<summary><b>Use case:</b> <one-line scenario title></summary>

<One or two sentences: who, what they are doing, concrete values if known.>

**Before**
1. <step>
2. <step>
3. <step>

**After**
1. (<n>) <step>
2. <step>
3. (<n>) <step>

**What else happens**

| Situation | Result |
|---|---|
| <situation> | <result> |
| ⚠️ <risky situation> | <result or "Check that…"> |

</details>

<details>
<summary><b>Overview</b></summary>

| | |
|---|---|
| **Why** | <the problem, in one or two sentences> |
| **(1) <part name>** | <what it does> |
| **(2) <part name>** | <what it does> |
| **Check this** | <the 1–3 things a reviewer should actually verify> |

</details>

<details>
<summary><b>Detail</b></summary>

**(1) <part name>**
- Files: `<path>`, `<path>`
- <key fact: endpoint, flag, constant, migration>

Before:
```<lang>
<only the lines that changed meaning>
```
After:
```<lang>
<only the lines that changed meaning>
```

**(2) <part name>**
- Files: `<path>`

**Tests:** <what is covered, what is not>

**Not checked:** <what you could not verify, e.g. "Only the PR description was available, not the diff." Write "Nothing" if you checked everything.>

</details>
```

---

## Notes

- **Before/after code:** include it only when you have the diff. Show the smallest snippet that shows the change in meaning. Skip pure renames and formatting.
- **About block:** write it for someone who has never used the feature. It is about the feature as it exists, not about the change. The change starts at "Change:".
- **"Live for users today":** this is where flags, deploy order, and shared code meet. If everything is behind an off flag except one shared helper, say exactly that. It changes how hard the reviewer must look.
- **Map with everything changed:** if every stop changes, the map is still useful as the path. The parts list carries the detail.
- **English only.** No other languages, and no translations.
