# CLAUDE.md

This file provides guidance to Claude Code when working with this repository.

## What This Is

LaTeX resume for Sagar Gupta (DevOps/MLOps Consultant at AWS). Auto-compiles via GitHub Actions on every push to `main`. PDF is published as a GitHub Release (versioned + `latest` tag).

## Commands

```bash
pdflatex resume.tex          # Local compilation (requires MiKTeX or TeX Live)
```

No package manager or build tool needed. The GitHub Actions workflow handles compilation and release automatically.

## Architecture

**Single-source LaTeX resume** with automated CI/CD:

- `resume.tex` - Main resume source (2-page, A4, Carlito font)
- `cover-letters/template.tex` - Cover letter template (copy + rename to use)
- `.github/workflows/compile-resume.yml` - Auto-compile, archive, version, release
- `resume-old/` - Archived previous PDF versions (auto-managed by workflow)

## Workflow

1. Edit `resume.tex` (or add a cover letter)
2. Push to `main`
3. GitHub Actions: compiles PDF -> archives old version -> creates release
4. Version bump via commit message: `[major]`, `[minor]`, or default patch

## Conventions

- **Font**: Carlito (sans-serif), 11pt, A4 paper
- **Custom commands**: `\resumeExp`, `\resumeEdu`, `\resumeAchievement` for consistent formatting
- **Hyperlinks**: All URLs, certifications, and project links are clickable (blue)
- **Icons**: FontAwesome (`\faGithub`, `\faGlobe`, `\faLinkedinSquare`, etc.)
- **Spacing**: Tight spacing optimized for 2-page layout - be careful with additions
- **Client names**: Anonymized for NDA compliance (e.g., "US-based Major Financial Services Firm")
- **Bullets**: Use `\item[$\diamond$]` for experience items, `\resumeAchievement` for achievements

## Content Sync

This resume should stay in sync with:
- `portfolio-react/data/experience.json` - Professional experience
- `portfolio-react/data/projects.json` - Projects and open source contributions
- `portfolio-react/data/achievements.json` - Certifications and achievements
- `portfolio-react/data/skills.json` - Technical skills

When updating resume content, check if the portfolio data files also need updating (and vice versa).

## Release Integration

The latest resume PDF is linked from:
- GitHub profile README (`Sagargupta16/Sagargupta16`)
- Portfolio website (`portfolio-react`)

Both use the `latest` release tag URL, so they auto-update on new releases.
