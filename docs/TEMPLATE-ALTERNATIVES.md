# LaTeX Resume Template Alternatives (2026-07)

Decision report. Sagar's current setup: Jake's Resume lineage (via sb2nov) + Carlito sans-serif + pdflatex + `glyphtounicode` + 9 modular variants.

## 1. Ranked table

| Rank | Template | Score | Stars | Last push | License | Engine |
|---|---|---|---|---|---|---|
| 1 | **sb2nov/resume** (Jake's parent) | **8.8** | 6.8k | 2026-05-17 | MIT | pdflatex |
| 2 | Sagar's current (Jake's + Carlito) | 8.6 | -- | 2026-07-01 | MIT | pdflatex |
| 3 | RenderCV | 7.4 | 17.0k | 2026-05-01 | MIT | **Typst** (not LaTeX) |
| 4 | Awesome-CV (posquit0) | 6.6 | 27.9k | 2026-03-13 | LPPL-1.3c | xelatex |
| 5 | AltaCV (liantze) | 5.8 | 1.6k | 2025-07-30 | LPPL | pdflatex/xelatex |
| 6 | ModernCV | 5.5 | 966 | 2026-06-24 | LPPL-1.3c | pdflatex |
| 7 | Jake's Resume (jakegut) | 5.0 | 2.7k | **archived 2024-08** | MIT | pdflatex |
| 8 | Deedy Resume | 3.8 | 5.0k | **2022-09** (stale) | Apache-2.0 | xetex |

FAANG-explicit, YAC, Simple Hipster CV, Sourcecodester -- no repos above 500 stars with active maintenance found in 2026-07 search. Skipping.

Scoring axes (weighted): ATS 25%, modular 20%, density 15%, GHA compile 15%, typography 10%, maintenance 10%, migration cost 5%.

## 2. Top pick: **sb2nov/resume** (Jake's parent, actively maintained)

sb2nov IS the upstream that Jake forked; Jake's fork went read-only in Aug 2024, sb2nov keeps shipping (last push 2026-05-17). Same command macros (`\resumeSubheading`, `\resumeItem`, `\resumeSubHeadingListStart`), same `\input{glyphtounicode}` + `\pdfgentounicode=1` ATS discipline, same section formatting -- so Sagar's `common/preamble.tex`, `common/header.tex`, `common/education.tex`, and every variant's `experience.tex` port over with **near-zero body changes**. sb2nov also improved a couple of macros post-Jake's freeze (spacing, hyperref config), which is exactly what Sagar needs.

The real win: sb2nov is already the de-facto ATS-safe pdflatex reference in the industry, GitHub Actions CI needs only `texlive-latex-recommended` + `texlive-fonts-extra` (already what Sagar has), and the Carlito swap can stay -- sb2nov uses default CM but does not enforce it. So this is a lift-shift of preamble improvements, not a rewrite.

Migration path (5-8 steps):
1. `git checkout -b chore/sb2nov-preamble-refresh`
2. Diff `common/preamble.tex` against latest sb2nov `resume.tex` head -- copy any new macros or spacing fixes.
3. Keep `\usepackage[sfdefault]{carlito}` and the `glyphtounicode` block Sagar already has -- both survive.
4. Keep the 9-variant `variants/*/resume-*.tex` layout unchanged (sb2nov uses one file, Sagar's modular split is strictly additive).
5. Recompile all 9 variants locally: `bash build.sh`.
6. `pdftotext -layout` each PDF; grep for `\xAD` (soft-hyphen leak) and `\uF0`-range PUA (icon garbage). Should be clean already.
7. Update `common/preamble.tex` header comment to credit sb2nov, drop the Jake reference.
8. Push, let GHA compile, tag `v3.x-sb2nov-refresh`.

## 3. Backup pick: **RenderCV**

If Sagar wants to bail on LaTeX entirely: RenderCV is YAML -> Typst -> PDF, ships an `sb2nov` theme + `engineeringresumes` + `classic` themes, defaults to Source Sans 3, has an `ATS Compatibility` section in docs, and 17k stars with commits this week. Variants are trivially expressed as separate YAML files sharing anchors. **But**: it's not LaTeX -- Sagar loses pdflatex CI, has to install Typst in GHA, gives up direct control over spacing/macros, and inherits Typst's ATS story instead of pdflatex's (well-understood, empirically clean). Use only if Sagar wants to escape LaTeX maintenance entirely; do not migrate for incremental gains.

## 4. What NOT to migrate to

- **Jake's Resume (jakegut/resume)** -- archived 2024-08-15, read-only. Sagar is already downstream; there is no upstream to pull from.
- **Deedy Resume** -- last push 2022-09, two-column XeTeX with FontAwesome icons in contact block. Two-column PDFs are notorious ATS extraction hazards (column order reversal in pdftotext), and dead maintenance. Aesthetic mismatch too: undergraduate CS student template, not senior consultant.
- **Awesome-CV** -- xelatex-only, Roboto + Source Sans Pro via `fontspec`. Beautiful but heavy: `banner.cls`-style class hides the machinery, GHA install is ~500MB heavier (texlive-xetex + texlive-fonts-extra + Roboto TTF), and its FontAwesome contact block is the same ATS hazard as Deedy. LPPL-1.3c license is fine but the class monolith fights Sagar's `common/` + `variants/` split -- migration cost is HIGH.

## 5. Verdict

**Stay with the current template. Refresh from sb2nov upstream only if a specific macro is newer there.**

Sagar's setup is already sb2nov + Carlito + `glyphtounicode` + `pdfgentounicode=1` + modular common/variants -- that IS the top-ranked answer, plus Carlito, plus 9 pre-tuned variants. Switching to sb2nov "properly" would be a diff of maybe 20 lines in `preamble.tex`; switching to anything else means throwing away 9 variant folders for aesthetic/maintenance parity at best. The specific hardening steps that matter more than any template swap:

- Verify `pdfgentounicode=1` + `\input{glyphtounicode}` are both present (they are).
- Replace any remaining `--` in source with explicit `\textendash{}` or the T1-safe `\char"2013{}` -- kills the 0xAD soft-hyphen leak at the source, not just via cmap.
- Swap FontAwesome icons in header for text labels wrapped in `\phantom{}` -- ATS parsers see the label, humans see the icon. (Or drop icons entirely; recruiter software increasingly OCRs headers and gets confused by PUA codepoints.)
- Pin `texlive-full` version in GHA workflow with a hash so Ubuntu image rotations don't silently swap Carlito for a different metric.
- Keep the `resume-old/` graveyard out of `builds/` and out of the release tarball -- it's the only real hygiene gap.

Migrating templates trades a known-good stack for someone else's opinions. Sagar already ranks #2 in his own list; #1 is a 20-line diff away, not a rewrite.
