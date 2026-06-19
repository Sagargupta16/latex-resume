# latex-resume skills

Repo-local Claude Code skills for the job-search workflow. Each folder has a `SKILL.md` that defines its trigger and steps; Claude loads them automatically in sessions started from this repo root.

| Skill | Purpose |
|-------|---------|
| `tailor-variant` | Match a resume variant to a job description |
| `ats-optimize` | Score keyword coverage vs a posting |
| `cover-letter` | Generate a company/role cover letter |
| `recruiter-outreach` | Draft recruiter / referral messages |
| `interview-prep` | STAR stories + system-design drills for the interview loop |

Full index and the recommended end-to-end flow: [docs/resume-skills.md](../../docs/resume-skills.md).

All five pull facts from [INFO.md](../../INFO.md) and follow [voice-principles.md](../../../../.claude/resources/voice-principles.md). They never fabricate, never edit `VERSION`/`CHANGELOG.md`, and edit variant `.tex` files rather than the root shim.
