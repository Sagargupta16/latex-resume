# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## What This Is

Multi-variant LaTeX resume system for Sagar Gupta (DevOps/MLOps Consultant at AWS). Generates 8 role-targeted PDFs from a shared codebase. Auto-compiles via GitHub Actions on every push to `main`. General resume is published as a GitHub Release (versioned + `latest` tag). Variant PDFs are committed to `builds/`.

## Commands

```bash
# Compile general resume
cd variants/general && pdflatex resume.tex && cd ../..

# Compile a specific variant (e.g., devops)
cd variants/devops && pdflatex resume-devops.tex && cd ../..
```

No package manager or build tool needed. The GitHub Actions workflow handles compilation and release automatically.

## Architecture

**Modular LaTeX resume** with shared sections and 8 role-specific variants:

### Shared sections (`common/`)
- `preamble.tex` - Packages, fonts, geometry, custom commands (`\resumeExp`, `\resumeEdu`, `\resumeAchievement`)
- `header.tex` - Name, contact info, links
- `education.tex` - NIT Warangal MCA + BCA
- `certifications.tex` - 6 AWS/Terraform certifications

### Variant sections (`variants/<slug>/`)
Each variant has: `resume[-slug].tex` (main), `summary.tex`, `experience.tex`, `skills.tex`, `projects.tex`, `oss.tex`, `achievements.tex`

| Variant | Slug | Focus |
|---------|------|-------|
| General | `general` | Balanced (default, released) |
| DevOps | `devops` | CI/CD, IaC, automation |
| Cloud | `cloud` | AWS architecture, migrations |
| MLOps | `mlops` | ML pipelines, model deployment |
| AI/ML | `aiml` | Deep learning, model training |
| SDE | `sde` | Full-stack, system design, DSA |
| Platform | `platform` | Internal tooling, governance |
| AI Tools | `ai-tools` | AI agents, MCP, developer tooling |

### How variants work
- Each variant's main `.tex` file inputs `../../common/preamble`, `../../common/header`, `../../common/education`, `../../common/certifications` for shared content
- Local `\input{summary}` etc. resolve to the variant directory's own files
- Section ordering differs per variant (e.g., SDE puts Skills + Projects before Experience)
- Must compile from within the variant directory (`cd variants/<slug>`)

### Other directories
- `builds/` - Auto-compiled variant PDFs (committed by CI)
- `resume-old/` - Archived previous general PDFs (auto-managed)
- `cover-letters/` - Cover letter templates
- `docs/superpowers/specs/` - Design specs

## Workflow

1. Edit shared sections in `common/` or variant sections in `variants/<slug>/`
2. Push to `main`
3. GitHub Actions: compiles all 8 variants -> general to root + release, variants to `builds/`
4. Version bump via commit message: `[major]`, `[minor]`, or default patch

## Conventions

- **Font**: Carlito (sans-serif), 11pt, A4 paper
- **Custom commands**: `\resumeExp`, `\resumeEdu`, `\resumeAchievement` for consistent formatting
- **Hyperlinks**: All URLs, certifications, and project links are clickable (blue)
- **Icons**: FontAwesome (`\faGithub`, `\faGlobe`, `\faLinkedinSquare`, etc.)
- **Spacing**: Tight spacing optimized for 2-page layout - be careful with additions
- **Client names**: Anonymized for NDA compliance (e.g., "US-based Major Financial Services Firm")
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
