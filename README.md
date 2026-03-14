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
| Auto (on push) | Any change to `resume.tex` on `main` |
| Manual | Actions tab -> "Compile Resume" -> Run workflow |

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
  resume-2026-03-14-36ae52e.pdf
.github/workflows/compile-resume.yml    # CI/CD pipeline
```

## Tech Stack

- **LaTeX** with Carlito font, FontAwesome icons, hyperref links
- **GitHub Actions** using [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action) for compilation
- **softprops/action-gh-release** for versioned releases
