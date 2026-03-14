# latex-resume

LaTeX resume with automated PDF compilation via GitHub Actions.

## Quick Start

1. Edit `resume.tex`
2. Push to `main`
3. PDF auto-compiles and appears in [Releases](../../releases/tag/latest)

## Download

**Latest PDF:** [resume.pdf](../../releases/download/latest/resume.pdf)

## How It Works

```
Push resume.tex -> GitHub Action triggers -> pdflatex compiles
                                          -> Archives old PDF to resume-old/
                                          -> Commits new resume.pdf
                                          -> Creates GitHub Release
```

| Trigger | When |
|---|---|
| Auto (on push) | Any change to `resume.tex` or `cover-letters/*.tex` on `main` |
| Manual | Actions tab -> "Compile Resume" -> Run workflow |

## Cover Letters

A reusable LaTeX template for company-specific cover letters.

**To create a new cover letter:**
1. Copy `cover-letters/template.tex` to `cover-letters/company-role.tex`
2. Fill in the placeholders (`COMPANY_NAME`, `ROLE_TITLE`, etc.)
3. Push to `main` -- it auto-compiles to `cover-letters/pdf/company-role.pdf`

The template file itself is not compiled -- only copies with real content are.

## Local Compilation

Requires a LaTeX distribution ([MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/)).

```bash
pdflatex resume.tex
pdflatex resume.tex   # run twice for hyperlinks
```

Or use VS Code with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension for live preview.

## Repo Structure

```
resume.tex                              # LaTeX source (edit this)
resume.pdf                              # Auto-compiled PDF (don't edit)
resume-old/                             # Archived previous versions (auto-managed)
cover-letters/
  template.tex                          # Reusable cover letter template
  pdf/                                  # Auto-compiled cover letter PDFs
.github/workflows/compile-resume.yml    # CI/CD pipeline
```

## Integration

This resume is the single source of truth. The compiled PDF is linked from:
- [GitHub Profile README](https://github.com/Sagargupta16) -- "Download Resume" button
- [Portfolio Website](https://sagargupta.online/portfolio-react/) -- "Download Resume" button

Both point to the release URL, so updating `resume.tex` here updates everywhere.

## Tech Stack

- **LaTeX** with Carlito font, FontAwesome icons, hyperref links
- **GitHub Actions** using [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action) for compilation
- **softprops/action-gh-release** for versioned releases
