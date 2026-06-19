---
name: tailor-variant
description: Use when Sagar pastes a job description (or a JD link/role title) and wants his resume tailored to it. Picks the best of the 8 LaTeX variants (general, devops, cloud, mlops, aiml, sde, platform, ai-tools), then rewrites that variant's summary/experience/skills/projects/oss .tex files to match the posting. Triggers on "tailor my resume to this", "which resume for this job", "match my resume to this JD", "customize the devops variant for X".
---

# Tailor a resume variant to a job description

Tailors one of the 8 role-targeted variants in this repo to a specific job. Editing is surgical and grounded in real facts only.

## Hard rules

- **Facts come only from [INFO.md](../../../INFO.md).** Never invent a metric, client, date, cert, or PR. If a JD asks for something Sagar doesn't have, say so -- do not fabricate it onto the resume.
- **Edit the variant `.tex` files, never `resume.tex` at the root** (that's a back-compat shim) and never the `common/` shared files unless the change is genuinely cross-variant.
- **Never touch `VERSION` or `CHANGELOG.md`** -- the CI `release` job owns them and will race with you.
- **Voice:** read [voice-principles.md](../../../../../.claude/resources/voice-principles.md) (the "Resume" register: action verb + measurable outcome + technology, no buzzwords, no em-dashes -- use `--`).
- **Name clients directly (RWS, State Street, DTCC) by default** across all variants -- these are already public on the portfolio and GitHub profile. Anonymize to descriptors (e.g. "US-based Major Financial Services Firm") only when Sagar explicitly asks for an anonymized copy for a specific recruiter.
- Keep the tight 2-page spacing. Don't add a bullet without removing equivalent length.

## Variant matrix

| Slug | Focus | Lead sections |
|------|-------|---------------|
| `general` | Balanced default (released) | Experience-first |
| `devops` | CI/CD, IaC, automation | Experience, Terraform-heavy skills |
| `cloud` | AWS architecture, migrations | Org/SCP/landing-zone bullets |
| `mlops` | ML pipelines, deployment, monitoring | SageMaker pipeline bullets |
| `aiml` | Deep learning, model training | Skills + projects up, certs down |
| `sde` | Full-stack, system design, DSA | Skills + projects before experience |
| `platform` | Internal tooling, self-service, governance | Module-library / guardrail bullets |
| `ai-tools` | AI agents, MCP, dev tooling | OSS up (MCP PRs), Claude Code skills |

## Steps

1. **Read the JD.** Extract: role title, must-have skills, nice-to-haves, seniority, domain, and the 10-15 keywords an ATS would scan for.
2. **Pick the variant.** Map the JD focus to the matrix above. State your pick and a one-line why. If two fit, recommend one and name the runner-up. Ask only if genuinely ambiguous.
3. **Gap-check against [INFO.md](../../../INFO.md).** List which JD requirements Sagar clearly meets, partially meets, and doesn't. Surface the doesn't-meet items explicitly -- never paper over them.
4. **Read the chosen variant's files** in `variants/<slug>/`: `summary.tex`, `experience.tex`, `skills.tex`, `projects.tex`, `oss.tex`, `achievements.tex`.
5. **Edit surgically.** Reorder/reword skills so JD keywords surface naturally. Sharpen 2-4 experience bullets to mirror the JD's language (using real outcomes from INFO.md). Swap in the most relevant projects/OSS. Rewrite the summary's first sentence to the target title.
6. **Compile to verify:** `cd variants/<slug> && pdflatex resume-<slug>.tex` (general uses `resume.tex`). Confirm it builds and stays 2 pages. Report the result -- a clean compile is the bar, not just an edit.
7. **Summarize** what changed and which keywords are now covered vs. still missing. Remind Sagar that pushing to `main` triggers auto-compile + the `builds/resume-<slug>.pdf` update.

## Notes

- If the JD fits none of the 8 variants well, propose creating a new variant (copy the closest one) rather than forcing a bad fit -- but ask first.
- Keep portfolio data in sync: significant content changes may also belong in `portfolio-react/data/*.json` (see repo CLAUDE.md "Content Sync").
- Pair with the `ats-optimize` skill to score coverage before/after editing.
