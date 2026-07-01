# Resume & Job-Search Skills

Repo-local Claude Code skills for the job-search workflow, living in [`.claude/skills/`](../.claude/skills/). They auto-load when a Claude Code session runs from this repo root; invoke any with the `Skill` tool or `/<name>`.

All five are grounded in two sources of truth and must never fabricate:
- [INFO.md](../INFO.md) -- the complete factual profile (experience, certs, OSS, projects, metrics).
- [voice-principles.md](../../../.claude/resources/voice-principles.md) -- how to write as Sagar (resume + outreach register).

| Skill | Use when you... | Edits / outputs |
|-------|-----------------|-----------------|
| [`tailor-variant`](../.claude/skills/tailor-variant/SKILL.md) | Have a JD and want the resume matched to it | Picks 1 of 9 variants, rewrites `variants/<slug>/*.tex`, recompiles |
| [`ats-optimize`](../.claude/skills/ats-optimize/SKILL.md) | Want a keyword-coverage score vs a posting | Coverage report + honest gap list + suggested bullet edits |
| [`cover-letter`](../.claude/skills/cover-letter/SKILL.md) | Need a company/role cover letter | New `cover-letters/<company>-<role>.tex` from the template, compiled |
| [`recruiter-outreach`](../.claude/skills/recruiter-outreach/SKILL.md) | Need a recruiter/referral message | Plain-text LinkedIn DM / cold email / referral ask in Sagar's voice |
| [`interview-prep`](../.claude/skills/interview-prep/SKILL.md) | Have an interview booked | STAR stories, system-design drills, company-specific prep (chat / scratch file) |

## End-to-end application flow

1. **`ats-optimize`** -- score the closest variant against the JD, find gaps.
2. **`tailor-variant`** -- apply edits, pick the variant, recompile to a clean 2-page PDF.
3. **`recruiter-outreach`** -- draft the intro message linking the tailored resume.
4. **`cover-letter`** -- generate the company-specific letter.
5. **`interview-prep`** -- once the screen lands, prep STAR + system design for the loop.

## Guardrails shared by all five

- Source facts only from [INFO.md](../INFO.md); never invent a metric, client, cert, or date.
- Edit variant `.tex` files, not the root `resume.tex` shim or `common/` (unless cross-variant).
- Never touch `VERSION` or `CHANGELOG.md` -- the CI `release` job owns them.
- Anonymize clients in recruiter-facing variants; the `general` variant may name public clients.
- No em-dashes (use `--`), no emojis, no buzzwords -- per voice-principles.
