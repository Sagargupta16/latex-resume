# latex-resume

LaTeX resume with 9 role-targeted variants and automated PDF compilation via GitHub Actions.

## Download

### General Resume (versioned releases)

**Latest PDF:** [resume.pdf](../../releases/download/latest/resume.pdf)

### Role-Targeted Variants

| Variant | Focus | Download |
|---------|-------|----------|
| **General** | Balanced (default) | [resume.pdf](../../releases/download/latest/resume.pdf) |
| **DevOps** | CI/CD, IaC, automation | [resume-devops.pdf](../../raw/main/builds/resume-devops.pdf) |
| **Cloud** | AWS architecture, migrations | [resume-cloud.pdf](../../raw/main/builds/resume-cloud.pdf) |
| **MLOps** | ML pipelines, model deployment | [resume-mlops.pdf](../../raw/main/builds/resume-mlops.pdf) |
| **AI/ML** | Deep learning, model training | [resume-aiml.pdf](../../raw/main/builds/resume-aiml.pdf) |
| **SDE** | Full-stack, system design, DSA | [resume-sde.pdf](../../raw/main/builds/resume-sde.pdf) |
| **Platform** | Internal tooling, governance | [resume-platform.pdf](../../raw/main/builds/resume-platform.pdf) |
| **AI Tools** | AI agents, MCP, developer tooling | [resume-ai-tools.pdf](../../raw/main/builds/resume-ai-tools.pdf) |
| **Big Tech** | FAANG/AI-lab SWE -- OSS + DSA forward | [resume-bigtech.pdf](../../raw/main/builds/resume-bigtech.pdf) |

## Quick Start

1. Edit files in `common/` (shared) or `variants/<role>/` (role-specific)
2. Push to `main`
3. All 9 PDFs auto-compile. General goes to [Releases](../../releases/tag/latest), variants to `builds/`.

## Architecture

```
common/                     # Shared sections (edit once, used by all variants)
  preamble.tex              # Packages, fonts, geometry, custom commands
  header.tex                # Name, contact info, links
  body.tex                  # Shared section order + \input scaffold for every variant
  education.tex             # Degrees
  certifications.tex        # 6 AWS/Terraform certs

variants/                   # Role-specific content (9 variants)
  general/                  # Default resume (versioned releases)
    resume.tex              # Main file - inputs common/body + local sections
    summary.tex, experience.tex, skills.tex, projects.tex, oss.tex, achievements.tex
  devops/                   # DevOps-focused variant
    resume-devops.tex       # Main file
    summary.tex, experience.tex, skills.tex, projects.tex, oss.tex, achievements.tex
  cloud/                    # Same structure for each role
  mlops/
  aiml/
  sde/
  platform/
  ai-tools/
  bigtech/                  # Uses letterpaper (FAANG US-recruiter default); others use A4

builds/                     # Compiled variant PDFs (auto-committed)
resume.pdf                  # Compiled general (root, released)
resume-old/                 # Archived previous general PDFs (last 6 kept, older pruned)
cover-letters/              # Cover letter template (real letters .gitignored)
```

All 9 variants share the same section order, wired via `common/body.tex`:

```
Summary -> Experience -> Certifications -> Education -> Projects -> Open Source -> Skills -> Achievements
```

`bigtech` inserts a `Talks & Publications` section between Skills and Achievements via `\variantExtraSections`. Each variant's main `.tex` sets up preamble + paper size, then `\input{../../common/body}` handles the rest.

## How It Works

```
Push .tex files -> GitHub Action triggers -> Compiles all 9 variants
                                          -> General PDF -> root + release
                                          -> Variant PDFs -> builds/
                                          -> Archives old general PDF
                                          -> Creates GitHub Release (general only)
```

| Trigger | When |
|---|---|
| Auto (on push) | Any change to `common/*.tex`, `variants/**/*.tex`, or `cover-letters/*.tex` on `main` |
| Manual | Actions tab -> "Compile Resume" -> Run workflow |

## Cover Letters

A reusable LaTeX template for company-specific cover letters.

**To create a new cover letter:**
1. Copy `cover-letters/template.tex` to `cover-letters/company-role.tex`
2. Fill in the placeholders (`COMPANY_NAME`, `ROLE_TITLE`, etc.)
3. Push to `main` -- it auto-compiles to `cover-letters/pdf/company-role.pdf`

## Local Compilation

Requires a LaTeX distribution ([MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/)).

The old root-level `resume.tex` shim was removed; compile from the variant directory:

```bash
# Compile general resume (canonical local build)
cd variants/general && pdflatex resume.tex && cd ../..

# Compile a specific variant
cd variants/devops && pdflatex resume-devops.tex && cd ../..
```

Or use VS Code with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.

## Deployment

Push to `main` -> GitHub Actions builds all 9 PDFs, commits them back, and cuts a new versioned release with `latest` tag realigned.

### Archive policy

`resume-old/` keeps the 6 most recent archived general PDFs; older ones are deleted on the 1st of each month. To prune manually:

```bash
ls -t resume-old/*.pdf | tail -n +7 | xargs rm -f
```

Full history lives on [GitHub Releases](../../releases) -- each release keeps its PDF attached.

## Integration

The general resume PDF is linked from:
- [GitHub Profile README](https://github.com/Sagargupta16) -- "Download Resume" button
- [Portfolio Website](https://sagargupta.online/portfolio-react/) -- "Download Resume" button

Both point to the `latest` release URL, so updating and pushing auto-updates everywhere.

## Tech Stack

- **LaTeX** with Carlito font, FontAwesome icons, hyperref links
- **GitHub Actions** using [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action) for compilation
- **softprops/action-gh-release** for versioned releases
