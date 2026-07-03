---
name: cover-letter
description: Use when Sagar wants a company- and role-specific cover letter generated from the LaTeX template in this repo. Triggers on "write a cover letter for X", "cover letter for the Y role at Z", "draft a cover letter". Copies cover-letters/template.tex to a new company-role.tex, fills the placeholders from INFO.md in Sagar's voice, and compiles it.
---

# Generate a cover letter

Produces a tailored, ready-to-compile cover letter from [cover-letters/template.tex.example](../../../cover-letters/template.tex.example).

Real cover letters (`cover-letters/*.tex`) and their compiled PDFs (`cover-letters/pdf/`) are `.gitignore`d so they never get committed. The `.example` template is the only tracked file.

## Hard rules

- **Facts only from [INFO.md](../../../INFO.md).** Real clients, certs, OSS, metrics. Never invent.
- **Voice:** read [voice-principles.md](../../../../../.claude/resources/voice-principles.md). Direct, concise, confident-not-cocky, specific over general. No em-dashes (`--`), no emojis, no corporate hedging, no buzzwords ("leverage", "synergy").
- **Client naming:** name clients directly (RWS, State Street, DTCC) by default -- these are public on the portfolio, so they're fine to use. Anonymize only if the target company is a direct competitor of a named client, or if Sagar explicitly asks.
- Keep it to one page (the template's geometry is tuned for that). Four short paragraphs.
- Output goes in `cover-letters/`; pushing to `main` auto-compiles it to `cover-letters/pdf/<name>.pdf`.

## Steps

1. **Gather inputs.** Need: company name, role title, and ideally the JD or 1-2 specifics about the company. If the company specifics are missing, ask for them or the JD -- a generic "I admire your company" opener is the one thing this skill must avoid.
2. **Copy the template.** Create `cover-letters/<company>-<role>.tex` (kebab-case, e.g. `stripe-platform-engineer.tex`) from [template.tex.example](../../../cover-letters/template.tex.example). Keep the header block verbatim. The new `.tex` file will be `.gitignore`d automatically.
3. **Fill placeholders:**
   - `COMPANY\_NAME`, `ROLE\_TITLE`, `CITY, STATE` -- from inputs.
   - `WHAT\_EXCITES\_YOU` -- one specific, true reason tied to the company/role (their product, scale, tech stack, mission). Not flattery.
   - `RELEVANT\_SKILLS\_FOR\_ROLE` -- map Sagar's real experience to the JD's top 2-3 requirements.
   - `WHY\_YOU\_ARE\_DIFFERENT` -- the strongest true differentiator for this role (e.g. 4x TFC Ambassador, published APG pattern, LeetCode Knight, OSS to Airflow/Prefect).
4. **Rewrite paragraph 2** so the experience cited actually matches the role -- swap the State Street / RWS examples for whichever real engagement best fits the JD.
5. **Compile:** `cd cover-letters && pdflatex <company>-<role>.tex`. Confirm it builds and fits one page. Report the result.
6. **Summarize** what you customized and flag anything you couldn't verify.

## Notes

- Escape LaTeX special chars in filled text (`&` -> `\&`, `%` -> `\%`, `_` -> `\_`, `#` -> `\#`).
- If Sagar wants several letters for similar roles, generate each as its own file -- don't overwrite.
