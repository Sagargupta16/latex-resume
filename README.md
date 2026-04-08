# latex-resume

LaTeX resume with 8 role-targeted variants and automated PDF compilation via GitHub Actions.

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

## Quick Start

1. Edit files in `common/` (shared) or `variants/<role>/` (role-specific)
2. Push to `main`
3. All 8 PDFs auto-compile. General goes to [Releases](../../releases/tag/latest), variants to `builds/`.

## Architecture

```
common/                     # Shared sections (edit once, used by all variants)
  preamble.tex              # Packages, fonts, geometry, custom commands
  header.tex                # Name, contact info, links
  education.tex             # Degrees
  certifications.tex        # 6 AWS/Terraform certs

variants/                   # Role-specific content
  general/                  # Default resume (versioned releases)
    resume.tex              # Main file - inputs common + local sections
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

builds/                     # Compiled variant PDFs (auto-committed)
resume.pdf                  # Compiled general (root, released)
resume-old/                 # Archived previous general PDFs
cover-letters/              # Cover letter templates
```

Each variant's main `.tex` file inputs shared sections from `common/` and local role-specific sections:

```latex
\input{../../common/preamble}
\begin{document}
\input{../../common/header}          % shared
\input{summary}                      % role-specific
\input{experience}                   % role-specific bullets
\input{../../common/certifications}  % shared
\input{oss}                          % role-specific PRs
\input{skills}                       % role-specific ordering
\input{projects}                     % role-specific selection
\input{../../common/education}       % shared
\input{achievements}                 % role-specific
\end{document}
```

## How It Works

```
Push .tex files -> GitHub Action triggers -> Compiles all 8 variants
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

```bash
# Compile general resume
cd variants/general && pdflatex resume.tex && cd ../..

# Compile a specific variant
cd variants/devops && pdflatex resume-devops.tex && cd ../..
```

Or use VS Code with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension.

## Integration

The general resume PDF is linked from:
- [GitHub Profile README](https://github.com/Sagargupta16) -- "Download Resume" button
- [Portfolio Website](https://sagargupta.online/portfolio-react/) -- "Download Resume" button

Both point to the `latest` release URL, so updating and pushing auto-updates everywhere.

## Tech Stack

- **LaTeX** with Carlito font, FontAwesome icons, hyperref links
- **GitHub Actions** using [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action) for compilation
- **softprops/action-gh-release** for versioned releases
