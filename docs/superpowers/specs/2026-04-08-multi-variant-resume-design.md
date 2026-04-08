# Multi-Variant Resume System - Design Spec

**Date:** 2026-04-08
**Status:** Approved
**Author:** Sagar Gupta + Claude Code

## Problem

A single general-purpose resume doesn't optimize for ATS keywords or hiring manager expectations across different role types. With experience spanning DevOps, Cloud, MLOps, AI/ML, SDE, Platform Engineering, and AI Developer Tools, each application benefits from a heavily tailored variant that emphasizes the most relevant skills, experience bullets, and projects.

## Goals

1. Generate 8 role-targeted resume PDFs from a shared LaTeX codebase
2. Minimize content duplication - shared sections (header, education, certifications) defined once
3. Maintain the current general resume release flow unchanged
4. All variant PDFs auto-compiled and accessible on every push to main
5. Easy download links for all variants

## Non-Goals

- Per-variant versioned releases (only general gets releases)
- Landing page or web UI for variant selection
- Dynamic/runtime resume generation (this is static LaTeX)
- ATS keyword optimization tooling (manual content for now)

## Variants

| ID | Slug | Focus | Example Titles |
|----|------|-------|---------------|
| 1 | `general` | Balanced (current resume) | Cloud Consultant, DevOps Engineer |
| 2 | `devops` | CI/CD, IaC, automation | DevOps Engineer, SRE |
| 3 | `cloud` | AWS architecture, migrations | Cloud Engineer, AWS Solutions Architect |
| 4 | `mlops` | ML pipelines, model deployment | MLOps Engineer, ML Platform Engineer |
| 5 | `aiml` | Deep learning, model training | ML Engineer, AI Engineer |
| 6 | `sde` | Full-stack, system design, DSA | Software Engineer, Backend Engineer |
| 7 | `platform` | Internal tooling, self-service, governance | Platform Engineer, Infrastructure Engineer |
| 8 | `ai-tools` | AI agents, MCP, developer tooling | AI Agent Engineer, AI Developer Tools |

## Architecture

### Directory Structure

```
latex-resume/
├── common/                              # Shared sections (edit once)
│   ├── preamble.tex                     # Packages, fonts, geometry, custom commands
│   ├── header.tex                       # Name, contact info, links
│   ├── education.tex                    # Degrees (NIT Warangal, BCA)
│   └── certifications.tex               # 6 AWS/Terraform certs
│
├── variants/                            # Role-specific content
│   ├── general/                         # Current resume (default, released)
│   │   ├── resume.tex                   # Main file - inputs common + local sections
│   │   ├── summary.tex
│   │   ├── experience.tex
│   │   ├── skills.tex
│   │   ├── projects.tex
│   │   ├── oss.tex                      # Open source contributions
│   │   └── achievements.tex
│   ├── devops/
│   │   ├── resume-devops.tex            # Main file
│   │   ├── summary.tex                  # DevOps-focused pitch
│   │   ├── experience.tex               # CI/CD, Terraform, IaC emphasis
│   │   ├── skills.tex                   # Terraform, Docker, GH Actions top
│   │   ├── projects.tex                 # Blue-Green Terraform, DevOps-AWS-FARM
│   │   ├── oss.tex                      # terraform-provider-aws, cloudposse
│   │   └── achievements.tex
│   ├── cloud/                           # Same structure
│   ├── mlops/
│   ├── aiml/
│   ├── sde/
│   ├── platform/
│   └── ai-tools/
│
├── builds/                              # Compiled variant PDFs (auto-committed)
│   ├── resume-devops.pdf
│   ├── resume-cloud.pdf
│   ├── resume-mlops.pdf
│   ├── resume-aiml.pdf
│   ├── resume-sde.pdf
│   ├── resume-platform.pdf
│   └── resume-ai-tools.pdf
│
├── resume.pdf                           # Compiled general (root, released)
├── resume-old/                          # Archived general PDFs
├── cover-letters/                       # Cover letter templates
├── CHANGELOG.md
├── README.md
├── VERSION
└── CLAUDE.md
```

### LaTeX Architecture

Each variant's main `.tex` file follows the same pattern:

```latex
% variants/devops/resume-devops.tex
\input{../../common/preamble}
\begin{document}
\input{../../common/header}          % SHARED - name, contact, links
\input{summary}                      % VARIANT - devops-focused pitch
\input{experience}                   % VARIANT - different bullet emphasis
\input{../../common/certifications}  % SHARED - 6 certs
\input{oss}                          % VARIANT - devops-relevant PRs only
\input{skills}                       % VARIANT - reordered for devops
\input{projects}                     % VARIANT - role-relevant selection
\input{../../common/education}       % SHARED - degrees
\input{achievements}                 % VARIANT - role-relevant
\end{document}
```

**Shared sections** (`common/`):
- `preamble.tex` - All `\usepackage`, geometry, font config, custom commands (`\resumeExp`, `\resumeEdu`, `\resumeAchievement`, list environments)
- `header.tex` - Name, portfolio link, GitHub, LinkedIn, email, phone
- `education.tex` - NIT Warangal MCA + BCA
- `certifications.tex` - 6 certifications with Credly links

**Variant sections** (per `variants/<slug>/`):
- `summary.tex` - 2-3 line pitch tailored to role
- `experience.tex` - Same 3 positions, different bullet points per engagement
- `skills.tex` - Same categories, different ordering and filtering
- `projects.tex` - 2-4 projects most relevant to the role
- `oss.tex` - 3-6 OSS contributions most relevant to the role
- `achievements.tex` - Filtered and reworded for role relevance

### Section Order Per Variant

Section ordering can differ per variant to put the strongest content first:

| Section | General | DevOps | Cloud | MLOps | AI/ML | SDE | Platform | AI Tools |
|---------|---------|--------|-------|-------|-------|-----|----------|----------|
| Header | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
| Summary | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 |
| Experience | 3 | 3 | 3 | 3 | 3 | 5 | 3 | 3 |
| Certs | 4 | 4 | 4 | 4 | 5 | 7 | 5 | 5 |
| OSS | 5 | 5 | 5 | 5 | 6 | 6 | 6 | 4 |
| Skills | 6 | 6 | 6 | 6 | 4 | 3 | 4 | 6 |
| Projects | 7 | 7 | 7 | 7 | 7 | 4 | 7 | 7 |
| Education | 8 | 8 | 8 | 8 | 8 | 8 | 8 | 8 |
| Achievements | 9 | 9 | 9 | 9 | 9 | 9 | 9 | 9 |

Notable reorderings:
- **SDE**: Skills and Projects move up (DSA/system design matters more than certs)
- **AI/ML**: Skills moves up (frameworks matter), Certs moves down
- **AI Tools**: OSS moves up (MCP contributions are directly relevant)

### Content Strategy Per Variant

#### DevOps
- **Summary**: CI/CD pipelines, IaC at scale, automation-first mindset
- **Experience bullets**: Terraform module library (38+ services), testing (tftest/PyTest), GitHub Actions CI/CD, blue-green ECS deployments, CodePipeline
- **Skills top**: Terraform, Docker, GitHub Actions, CI/CD, Blue-Green, Ansible
- **Projects**: Blue-Green AWS Terraform, DevOps-AWS-FARM
- **OSS**: terraform-provider-aws, cloudposse/terraform-aws-tfstate-backend, Airflow

#### Cloud
- **Summary**: AWS architecture, multi-account strategy, enterprise migrations
- **Experience bullets**: AWS Organizations/SCPs/tag policies, 50+ workload migration, Landing Zone, compliance (CCMv4.0), architecture decisions
- **Skills top**: AWS Organizations, SCPs, Landing Zone, CloudFormation, Migration
- **Projects**: Blue-Green AWS Terraform
- **OSS**: terraform-provider-aws, terraform-aws-bedrock, terraform-aws-dynamodb-table

#### MLOps
- **Summary**: End-to-end ML pipelines, model deployment, monitoring
- **Experience bullets**: SageMaker pipeline, blue-green model deployment, drift detection, auto-scaling endpoints, CodePipeline for ML, API Gateway + Lambda inference
- **Skills top**: SageMaker, ML Pipelines, Drift Detection, Model Deployment, Monitoring
- **Projects**: LeetCode Rating Predictor (ML pipeline angle)
- **OSS**: Feast, Airflow, Prefect

#### AI/ML
- **Summary**: Deep learning, model training, neural networks, data pipelines
- **Experience bullets**: Medical image classification, ensemble models, SageMaker training
- **Skills top**: PyTorch, TensorFlow, scikit-learn, Neural Networks, Deep Learning
- **Projects**: LeetCode Rating Predictor (NN architecture), GroundZeroNN, StockSage AI
- **OSS**: Feast, dspy

#### SDE
- **Summary**: Full-stack engineer, Python/TypeScript, system design, competitive programmer
- **Experience bullets**: Built Terraform module library (software engineering angle), self-service capabilities, API design
- **Skills top**: Python, TypeScript, React, FastAPI, System Design, MongoDB
- **Projects**: Ledger Sync, Code Arena, GitScope, LeetCode Rating Predictor
- **OSS**: Prefect, Airflow
- **Achievements**: LeetCode Knight (2007), Google Kick Start Top 5%, 1200+ problems

#### Platform
- **Summary**: Internal developer platforms, self-service tooling, governance at scale
- **Experience bullets**: Terraform module library adopted across client platform, self-service with governance guardrails, preventative security controls, EventBridge patterns
- **Skills top**: Terraform modules, IaC testing, EventBridge, Self-Service, Governance
- **Projects**: Blue-Green AWS Terraform, MCP Toolkit
- **OSS**: terraform-provider-aws, cloudposse

#### AI Tools
- **Summary**: AI developer tooling, MCP protocol, agent frameworks, LLM integration
- **Experience bullets**: Kiro for AI-driven specs, Amazon Q for code analysis, Claude Code workflows
- **Skills top**: Claude Code, MCP Protocol, Kiro, LLM APIs, RAG Pipelines, Agent Frameworks
- **Projects**: GitScope, SelfHub, Claude Skills, Claude Cost Optimizer
- **OSS**: awslabs/mcp, Feast (Claude Code skills)

## Release & Download Strategy

### General Resume (unchanged from current)
- Versioned releases: `v1.1.0`, `v1.1.1`, etc.
- Floating `latest` tag always points to newest
- PDF attached as release asset
- Download: `github.com/Sagargupta16/latex-resume/releases/download/latest/resume.pdf`

### Variant Resumes
- Compiled PDFs committed to `builds/` directory on every push
- Always reflect latest main branch content
- Download: `raw.githubusercontent.com/Sagargupta16/latex-resume/main/builds/resume-<slug>.pdf`
- No separate releases or tags for variants

### Version Bumping
- Same as current: `[major]`/`[minor]` in commit message, default patch
- VERSION file tracks one unified version for the whole repo
- CHANGELOG documents changes across all variants

## CI/CD Pipeline

### Workflow: `compile-resume.yml` (modified)

**Triggers:**
- Push to `main` when any `.tex` file changes (in `common/`, `variants/`, or `cover-letters/`)
- Manual workflow dispatch

**Steps:**

1. **Checkout** repository
2. **Compile all variants** - Loop through each `variants/<slug>/resume*.tex`, compile with pdflatex
3. **Move variant PDFs** to `builds/` directory (rename to `resume-<slug>.pdf`)
4. **Archive old general PDF** to `resume-old/resume-{date}-{hash}.pdf`
5. **Move general PDF** to root as `resume.pdf`
6. **Commit all PDFs** (general + all variants in builds/)
7. **Bump VERSION** and update CHANGELOG
8. **Create release** for general resume only (versioned + `latest` tag)
9. **Upload artifact** (general PDF, 90-day retention)

### Compilation Details

Each variant is compiled from its own directory so `\input{summary}` resolves to the local file:

```bash
for variant_dir in variants/*/; do
  slug=$(basename "$variant_dir")
  tex_file=$(find "$variant_dir" -name "resume*.tex" -maxdepth 1)
  cd "$variant_dir"
  pdflatex -interaction=nonstopmode "$(basename "$tex_file")"
  cd ../..
  if [ "$slug" = "general" ]; then
    cp "$variant_dir"resume.pdf resume.pdf
  else
    cp "$variant_dir"resume-*.pdf "builds/resume-${slug}.pdf"
  fi
done
```

## Migration Plan

### Phase 1: Restructure (no content changes)
1. Create `common/` directory
2. Extract shared sections from current `resume.tex` into `common/` files
3. Create `variants/general/` with the remaining variant-specific sections
4. Create `variants/general/resume.tex` that inputs from both locations
5. Verify compilation produces identical PDF to current

### Phase 2: Workflow update
1. Update `compile-resume.yml` to compile from `variants/general/`
2. Add loop to compile all variant directories
3. Create `builds/` directory
4. Test workflow produces same release behavior for general

### Phase 3: Add variants (one at a time)
1. Start with `devops` (closest to general, easiest to validate)
2. Copy `variants/general/` as starting point
3. Modify content for DevOps focus
4. Verify compilation
5. Repeat for remaining 6 variants

### Phase 4: Documentation
1. Update README with variant information and download links
2. Update CLAUDE.md with new structure
3. Update CHANGELOG

## Testing

- Each phase must produce a valid PDF before proceeding
- General resume PDF must be byte-comparable (or visually identical) after Phase 1 restructure
- CI must pass on every phase before merging
- All 8 variants must compile without errors before Phase 3 is complete

## Open Questions

None - all decisions finalized during design review.
