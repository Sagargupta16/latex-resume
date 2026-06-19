---
name: ats-optimize
description: Use when Sagar wants to score a resume variant against a job description for ATS (applicant tracking system) keyword coverage, or asks "will this pass ATS", "what keywords am I missing", "score my resume against this posting", "is my devops resume keyword-optimized". Reports a coverage score, missing must-have terms, and concrete bullet edits to close gaps -- without keyword-stuffing or fabricating experience.
---

# ATS keyword optimization

Scores a variant's keyword coverage against a job description and recommends honest edits. This skill diagnoses; pair it with `tailor-variant` to apply the edits.

## Hard rules

- **Never invent experience to match a keyword.** If the JD wants Kubernetes and Sagar's real history (see [INFO.md](../../../INFO.md)) doesn't have it, report it as a genuine gap -- do not add it to the resume.
- **No keyword stuffing.** Keywords must appear in natural, truthful bullets. A hidden-text or comma-list keyword dump fails human review and many modern ATS.
- **Source of truth is [INFO.md](../../../INFO.md)** for what Sagar has actually done.
- Match resume voice in any suggested edits: action verb + outcome + tech, no buzzwords, `--` not em dash (see [voice-principles.md](../../../../../.claude/resources/voice-principles.md)).

## Steps

1. **Extract JD keywords.** Pull hard skills, tools, certs, and role terms from the posting. Split into:
   - **Must-have** (listed under requirements / "you have")
   - **Nice-to-have** (preferred / bonus)
   - **Soft/contextual** (domain, methodology, seniority)
2. **Read the target variant.** Concatenate the text content of `variants/<slug>/{summary,experience,skills,projects,oss,achievements}.tex` plus `common/{header,education,certifications}.tex`. If Sagar didn't name a variant, infer it from the JD (see the `tailor-variant` matrix) and state your pick.
3. **Match.** For each must-have and nice-to-have keyword, mark Present / Partial (synonym or implied) / Missing. ATS often does exact-token matching, so note when Sagar has the skill under a different label (e.g. JD says "IaC", resume says "Terraform").
4. **Score.** Report `must-have coverage = present / total` and `nice-to-have coverage` as percentages. Call ~80%+ must-have a strong match; flag below ~60% as a stretch.
5. **Recommend edits.** For each Missing/Partial that Sagar *truthfully* has (per INFO.md), give the exact bullet rewrite and which file/line it goes in. For genuine gaps, list them separately as "cannot honestly claim" -- do not suggest adding them.
6. **Formatting check.** Confirm the resume avoids ATS-hostile constructs: no text in images, no tables that scramble reading order, standard section headings, machine-readable PDF (this repo's pdflatex output is text-based -- good). Note any risk.

## Output shape

```
Variant scored: devops
Must-have coverage: 11/13 (85%)  -- strong match
Nice-to-have: 4/7 (57%)

Present:        Terraform, CI/CD, AWS, GitHub Actions, IaC, ...
Partial:        "observability" -> have CloudWatch/X-Ray, not named as observability
Missing (have): Ansible (in INFO.md, not in this variant's skills.tex) -> add
Missing (gap):  Kubernetes -- not in Sagar's real history, do not add

Suggested edits:
- variants/devops/skills.tex: add "Ansible" to the IaC line
- variants/devops/experience.tex bullet 1: surface "observability" alongside X-Ray/CloudWatch
```

## Notes

- Don't over-optimize for one ATS at the cost of human readability -- a recruiter reads it after the parser.
- After recommending, offer to hand off to `tailor-variant` to apply edits and recompile.
