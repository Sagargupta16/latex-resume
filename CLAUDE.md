# CLAUDE.md

> This file stacks on top of the workspace root at `C:\Code\GitHub\`:
> - Root [`CLAUDE.md`](../../CLAUDE.md) -- voice, rules, routing map, references, skills, slash commands, conventions.
> - Root [`MEMORY.md`](../../MEMORY.md) -- live facts across repos.
> - Root [`STATUS.md`](../../STATUS.md) -- live PR/CI/security dashboard.
> - [`.claude/resources/`](../../.claude/resources/README.md) -- deep reference for collaboration, workflow, git, OSS, debugging, voice.
>
> Read those first. The guidance below only adds **repo-specific context** -- it does not override anything in the root.


This file provides guidance to Claude Code when working with this repository.

## What This Is

Multi-variant LaTeX resume system for Sagar Gupta (DevOps/MLOps Consultant at AWS). Generates 9 role-targeted PDFs from a shared codebase. Auto-compiles via GitHub Actions on every push to `main`. General resume is published as a GitHub Release (versioned + `latest` tag). Variant PDFs are committed to `builds/`.

## Commands

```bash
# Compile all 9 variants at once (preferred for local testing)
./build.sh

# Compile general resume only
cd variants/general && pdflatex resume.tex && cd ../..

# Compile a specific variant (e.g., devops)
cd variants/devops && pdflatex resume-devops.tex && cd ../..
```

No package manager or build tool needed -- just a LaTeX distribution (MiKTeX or TeX Live). The GitHub Actions workflow handles compilation and release automatically on push.

### Local build

The canonical source for the general variant is `variants/general/resume.tex`. The old root-level `resume.tex` shim has been deleted; compile from within the variant directory (`cd variants/general && pdflatex resume.tex`).

## Architecture

**Modular LaTeX resume** with shared sections and 9 role-specific variants:

### Shared sections (`common/`)

- `preamble.tex` - Packages, fonts, geometry, custom commands (`\resumeExp`, `\resumeEdu`, `\resumeAchievement`)
- `header.tex` - Name, contact info, links
- `education.tex` - NIT Warangal MCA + BCA
- `certifications.tex` - 6 AWS/Terraform certifications

### Variant sections (`variants/<slug>/`)

Each variant has: `resume[-slug].tex` (main), `summary.tex`, `experience.tex`, `skills.tex`, `projects.tex`, `oss.tex`, `achievements.tex`

| Variant  | Slug       | Focus                                |
| -------- | ---------- | ------------------------------------ |
| General  | `general`  | Balanced (default, released)         |
| DevOps   | `devops`   | CI/CD, IaC, automation               |
| Cloud    | `cloud`    | AWS architecture, migrations         |
| MLOps    | `mlops`    | ML pipelines, model deployment       |
| AI/ML    | `aiml`     | Deep learning, model training        |
| SDE      | `sde`      | Full-stack, system design, DSA       |
| Platform | `platform` | Internal tooling, governance         |
| AI Tools | `ai-tools` | AI agents, MCP, developer tooling    |
| Big Tech | `bigtech`  | FAANG / AI-lab SWE -- OSS + DSA forward |

### How variants work

- Each variant's main `.tex` file inputs `../../common/preamble`, `../../common/header`, `../../common/education`, `../../common/certifications` for shared content
- Local `\input{summary}` etc. resolve to the variant directory's own files
- All variants share the same section order: Summary -> Experience -> Certifications -> Education -> Projects -> Open Source -> Skills -> Achievements. Bigtech inserts a Talks & Publications section between Skills and Achievements.
- Must compile from within the variant directory (`cd variants/<slug>`)

### Other directories

- `builds/` - Auto-compiled variant PDFs (committed by CI)
- `resume-old/` - Archived previous general PDFs (auto-managed)
- `cover-letters/` - Cover letter templates, PDFs land in `cover-letters/pdf/`
- `docs/` - Design specs and reference notes
- `INFO.md` - Long-form reference doc on the project (variant matrix, workflow deep-dive)

## Workflow

1. Edit shared sections in `common/` or variant sections in `variants/<slug>/`
2. Push to `main`
3. GitHub Actions: compiles all 9 variants -> general to root + release, variants to `builds/`
4. Version bump via commit message: `[major]`, `[minor]`, or default patch

### CI details worth knowing

- **Path filter**: the `Compile Resume` workflow only runs on pushes that touch `common/*.tex`, `variants/**/*.tex`, or `cover-letters/*.tex`. README/docs-only pushes do **not** produce a new PDF or release. Use "Run workflow" in the Actions tab if you need to force a rebuild.
- **Two jobs**: `compile` builds PDFs and commits them back to `main` (as `github-actions[bot]`); `release` then bumps `VERSION`, prepends a CHANGELOG entry, creates a `vX.Y.Z` release, and **recreates the `latest` tag/release** so downstream links (profile README, portfolio site) update automatically.
- **Never edit `VERSION` or `CHANGELOG.md` manually** in the same commit as content changes -- the `release` job owns both files and will race with you. Let the workflow manage them.
- **Auto-commits from CI**: the workflow pushes `resume.pdf`, `builds/`, `resume-old/`, and `cover-letters/pdf/` back to `main`. Expect your `git pull` to pick up a `chore: auto-compile resume PDFs` commit after every content push.

## Conventions

- **Font**: Carlito (sans-serif), 11pt. **Paper**: A4 for all variants except `bigtech`, which uses `letterpaper` (FAANG US-recruiter default).
- **Custom commands**: `\resumeExp`, `\resumeEdu`, `\resumeAchievement` for consistent formatting
- **Hyperlinks**: All URLs, certifications, and project links are clickable (blue)
- **Icons**: FontAwesome (`\faGithub`, `\faGlobe`, `\faLinkedinSquare`, etc.)
- **Spacing**: Tight spacing optimized for 2-page layout - be careful with additions
- **Client names**: Name clients directly (RWS, State Street, DTCC) across **all** variants and the cover letters -- these names are already public on the portfolio site and GitHub profile. Anonymize to descriptors (e.g., "US-based Major Financial Services Firm") only when Sagar explicitly asks for an anonymized copy for a specific recruiter.
- **Bullets**: Use `\item[$\diamond$]` for experience items, `\resumeAchievement` for achievements
- **Hyphens**: Use single `-` in titles, never em dash

## Content Sync

This resume should stay in sync with:

- `portfolio-react/data/experience.json` - Professional experience
- `portfolio-react/data/projects.json` - Projects and open source contributions
- `portfolio-react/data/achievements.json` - Certifications and achievements
- `portfolio-react/data/skills.json` - Technical skills

When updating resume content, check if the portfolio data files also need updating (and vice versa).

## Release Integration

The latest general resume PDF is linked from:

- GitHub profile README (`Sagargupta16/Sagargupta16`)
- Portfolio website (`portfolio-react`)

Both use the `latest` release tag URL, so they auto-update on new releases.
Variant PDFs are accessible via raw GitHub URLs: `raw.githubusercontent.com/.../main/builds/resume-<slug>.pdf`