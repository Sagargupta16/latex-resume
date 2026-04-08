# Changelog

All notable changes to this resume are documented here.

**Versioning**: `MAJOR.MINOR.PATCH`
- **Major**: Career milestones (new job, graduation, major role change)
- **Minor**: New projects, skills, certifications, experience updates
- **Patch**: Small fixes, formatting improvements, typos

Use `[major]` or `[minor]` in commit messages to control version bumps. Default is patch.

## [1.0.10] - 2026-04-08

- chore: auto-compile resume PDFs

## [1.0.9] - 2026-04-08

- chore: auto-compile resume PDFs

## [Unreleased]

- Add multi-variant resume system with 8 role-targeted variants
- Create common/ directory for shared sections (preamble, header, education, certifications)
- Create variants/ directory with general, devops, cloud, mlops, aiml, sde, platform, ai-tools
- Each variant has tailored summary, experience bullets, skills ordering, projects, and OSS contributions
- Update CI workflow to compile all 8 variants (general to root + release, variants to builds/)
- Add builds/ directory for auto-compiled variant PDFs
- Update README with variant download links and architecture docs
- Update CLAUDE.md with multi-variant architecture documentation

## [1.0.8] - 2026-03-30

- chore: auto-compile resume PDF

## [1.0.7] - 2026-03-28

- chore: auto-compile resume PDF

## [1.0.6] - 2026-03-28

- Add professional summary section for stronger first impression
- Restructure experience bullets with engagement-level detail and metrics
- Add Open Source Contributions section (Airflow, Terraform Provider AWS, Feast, Prefect, awslabs/mcp, cloudposse)
- Add AI Developer Tools to skills (Claude Code, GitHub Copilot, Amazon Q, Kiro, MCP Protocol)
- Add Kiro usage in RWS engagement and Amazon Q in DTCC engagement
- Reorganize skills section: Cloud & Infrastructure, MLOps & AI/ML, AI Developer Tools, Languages, Frameworks
- Shrink internship sections to 1 bullet each
- Remove Positions of Responsibility and Coding Profiles sections
- Remove less relevant projects (Placemento, Instagram Likes Leaderboard)
- Consolidate achievements to top 3
- Rename title from "Cloud & MLOps Engineer" to "Cloud & DevOps/MLOps Engineer"

## [1.0.5] - 2026-03-05

- Expand TypeScript notes

## [1.0.4] - 2026-03-05

- Add Kubernetes notes

## [1.0.3] - 2026-02-24

- Add GitHub Actions workflow for resume versioning and PDF automation

## [1.0.2] - 2025-09-27

- Update resume content and formatting

## [1.0.1] - 2025-08-08

- Refactor resume versioning workflow, simplify PDF detection logic

## [1.0.0] - 2025-07-25

- Initial version with current projects and NIT Warangal experience
- LaTeX resume with auto-compile via GitHub Actions
- Cover letter template
- Release PDF auto-published on every push
