# Canonical facts (source of truth for all 9 variants + portfolio)

Every disputed number in the audit reconciled here. If a variant or portfolio JSON disagrees, edit them, never this file. INFO.md remains the long-form reference; this file is the short truth table for numeric claims that recruiters check.

Reconciled 2026-07-03 from INFO.md + Credly + verified PR data. Certifications, open source, coding profiles and project numbers re-verified live 2026-10-10.

## Identity

| Field | Canonical value |
|---|---|
| Full name | Sagar Gupta |
| Job title on resume | `ProServe (Cloud Consultant) - DevOps/MLOps` (set by Sagar 2026-10-14; use this exact string on every surface) |
| Job title on portfolio | `ProServe (Cloud Consultant) - DevOps/MLOps at AWS` (`@ AWS` in short labels) |
| Employer | Amazon Web Services (AWS), Professional Services |
| Internal title (do NOT show externally) | Associate Delivery Consultant, ProServe DC |
| Location | Hyderabad, India |
| Email | sg85207@gmail.com |
| Phone | +91-8770532413 |
| Portfolio | https://sagargupta.online/portfolio-react/ |
| GitHub | https://github.com/Sagargupta16 |
| LinkedIn | https://www.linkedin.com/in/sagar-gupta-16-10/ |
| LeetCode | https://leetcode.com/Sagargupta1610/ |

## Experience: AWS ProServe (Aug 2024 -- Present)

### RWS (Feb 2026 -- Present)

Source of record: the engagement write-up of 2026-10-10 (verified facts only). Write each point as need, what was built, result. Never include programme codenames, Region names, vendor products, colleague names or internal AWS recognition.

- Role framing: `Lead DevOps Consultant -- RWS`, the DevOps and IaC lead. Never `sole DevOps consultant` (a second DevOps consultant joined in 2026).
- Scale: `4,000+ resources across 20+ Terraform Cloud workspaces, none failing`. Do not use `50+ application workloads` or `135+ AWS accounts`; the write-up does not support them.
- Automation gain: `per-account setup cut from 3+ days to under 4 hours (~90%)`. Always with the baseline; no naked `~90%`.
- Foundation: Organizations OUs with Control Tower baselines, SCPs, tag policies, least-privilege account baselines with a security baseline (IMDSv2, EBS encryption, public-access blocks, no default VPC), IAM Identity Center, AWS Backup and SSM Patch Manager in every workload account, all in Terraform Cloud with OIDC, replacing account vending by a legacy pipeline.
- Networking: two Transit Gateway hubs in separate AWS Regions with Network Firewall inspection and VPN/Direct Connect, plus self-service onboarding (route table within 15 minutes, firewall access by tag in about a minute, no network-team ticket).
- IPAM: approved after measured sandbox billing; prefix delegation, about 94% lower projected cost.
- Safety: every change applied in a sandbox mirror first through the same least-privilege role.
- Speed: a second landing zone foundation in about four weeks, ahead of schedule.
- AI: `Kiro and Claude Code for requirement analysis, specs and design documentation`.

### State Street (Oct 2024 -- Aug 2025)

- Role: `DevOps Consultant`.
- Scope claim: `Terraform for about 10 AWS services with automated tests, on the regulated landing zone team, part of the path that opened 38+ services to application teams`. Not a `38+ service module library`; that overstated it.
- Detective: `designed Amazon Detective enablement (delegated admin in the Audit account via an AFT customization, organization-wide auto-enable in Terraform)`.
- CCMv4.0: `worked on the security solution behind 1,000+ preventative controls aligned with CCMv4.0 (team result)`. Never `Architected 1000+`.
- Testing: `tftest + PyTest`.
- Delivery signal: `10/10 CSAT` only. No Pulse ratings: none exist to back them.

### DTCC (Aug 2025 -- Nov 2025)

- Role: `DevOps Consultant`.
- Scope: `Modernized legacy Terraform to cloud-native IaC patterns on high-sensitivity financial workloads`.
- Amazon Q usage: `Used Amazon Q to accelerate code analysis and migration assessments`. NOT `leveraged` (banned by voice principles).
- IMPORTANT: DTCC MUST appear in every variant that lists RWS + State Street. Missing on `aiml`, `mlops`, `bigtech` today -- leaves a 6-month gap Aug 2025 to Feb 2026.

### Internal impact (roll into experience or extract to Talks section)

- Published APG pattern (1): `Secure PR Previews and Approval-Gated Releases for Amplify Gen 2 with GitHub` (2025).
- 2 peer-reviewed APG patterns pending publication. Frame as: `plus 2 more peer-reviewed in publication pipeline`. Show this on `general`, `bigtech`, `platform`, `cloud`. On other variants, one-line `Published APG Pattern on AWS Prescriptive Guidance` is fine.
- MLOps SME Program Graduate (2025).
- 5x TFC Ambassador: `AI/ML, NGDE (Graduated), CloudOps (AWS DevOps Agent), Agentic AI, Serverless`. Portfolio's `4x` is stale -- fix to 5x. INFO.md line 314 (`4x`) is also stale -- fix to 5x.
- 2 org-wide tech talks: Terraform testing (2025); GitOps pipeline gating (2026).
- Associate Speaker Certified (2026).
- MLOps Pipeline (SME Program, Jun-Aug 2025): SageMaker medical image classification, blue-green endpoints, drift detection.

## Published AWS samples (verified 2026-10-18 against each repo's main branch)

**aws-samples/sample-sagemaker-image-classification-mlops** (main at `c124044`):

- Size: `86 Terraform files across 4 stacks and 13 reusable modules` (`git ls-files '*.tf' | wc -l`, `ls -d modules/*/`). Never `89 files` or `14 modules`: those were the first release, before PR #4 removed the SageMaker Model Monitor module.
- Drift: `PSI drift detection` on the endpoint's output scores (`scripts/drift/compute_drift.py`), hourly. Never `Model Monitor`. A drift or fairness alarm **starts retraining**; it does not roll back.
- Rollback: blue/green canary (10% of the new fleet's capacity by default; `LINEAR` and `ALL_AT_ONCE` selectable) with auto-rollback on the endpoint **error and latency alarms**. Say `canary`, not `weighted traffic shifting`.
- Gates: clinical quality gate (accuracy >= 0.85, recall >= 0.95, precision >= 0.80, AUC >= 0.90) plus a Fairlearn fairness gate; every model registers as `PendingManualApproval`.
- Explanations: Grad-CAM and sampled **region Shapley** values. Not the SHAP library.
- A2I human review is **optional** and off by default (`enable_human_review = false`).
- Stack: TensorFlow/Keras training jobs (VGG16, DenseNet121, EfficientNetV2M ensemble), a TensorFlow Serving endpoint, a plain Python Lambda behind API Gateway, a static HTML/JS web UI on CloudFront. There is **no FastAPI and no React** in the repo.
- Do not claim a model was trained and shipped: the README's September 2026 BreakHis run failed the gates (accuracy 0.76, recall 0.90) and registered nothing. Say the pipeline trains, gates and ships.
- Security: checkov 0 failed checks in CI (run 37437169016 on `c124044`), every skip documented.

**aws-samples/sample-aws-terraform-org-governance** (main at `c4e0b38`):

- Policy types: `six policy types` (SCP, RCP, tag, backup, AI services opt-out, chat applications) as 20 policy documents. Never `all six`: the AWS Organizations user guide lists 13 policy types (2 authorization, 11 declarative) as of 2026-10-18.
- Delegated admin: `15 services` (17 resources in `delegation.tf`, minus the Access Analyzer service-linked role and the Macie management-account enablement).
- OU tree up to 5 levels, Control Tower baselines parent before child, a 513-entry Control Tower control ID map.

## Earlier roles

- `Associate Professional Services -- DevOps (Internship)`, AWS, Mar 2024 -- Jul 2024.
- `Software Developer Associate (Internship)`, Ikarus-3D, May 2023 -- Jul 2023.

## Education

- MCA, NIT Warangal: `Sep 2021 -- Jul 2024`. CGPA 8.38. NIMCET AIR 208. First Division with Distinction. (INFO.md is authoritative -- current resume `Aug 2021 -- Jun 2024` is off by one month on both ends.)
- BCA, DAVV Indore: `May 2018 -- Aug 2021`. CGPA 7.34. (Current resume `Jun 2018 -- Jun 2021` is wrong on both ends.)

## Certifications (5 industry)

Ordered by relevance to primary target role (Cloud/DevOps/MLOps). Match badge IDs from Credly.

| # | Name | Issued | Expires |
|---|---|---|---|
| 1 | AWS Certified Solutions Architect -- Associate | Jul 2024 | Jul 2027 |
| 2 | AWS Certified Developer -- Associate | Jan 2026 | Jan 2029 |
| 3 | AWS Certified Machine Learning Engineer -- Associate | Jun 2025 | Jun 2028 |
| 4 | AWS Certified AI Practitioner | Jul 2025 | Jul 2028 |
| 5 | AWS Certified Cloud Practitioner | May 2024 | May 2027 |

Expired: HashiCorp Certified: Terraform Associate (003), issued Sep 2024, expired 2026-09-10. It is off every variant. Canonical claim is `5x AWS certified`; never `6x` or `AWS/HashiCorp certified`.

Note: Cloud Practitioner expiry in portfolio JSON was `2029-01-31` -- that is Developer Associate's expiry, not Cloud Practitioner's. Fix to `2027-05-02` (3-year standard).

Optional resume additions from learning badges: `Well-Architected Proficient (Jan 2026)`, `AWS AI-DLC Ambassador L100 (Jun 2026)`. Both are current and role-relevant.

## Open source (RECONCILED, verified 2026-10-10)

**Merged (11 PRs, 10 repos):**
1. Apache Airflow #63109 -- 2026-03-23 -- template_fields on SalesforceBulkOperator.
2. PrefectHQ/prefect #20956 -- 2026-03-04 -- deployment-steps-as-Python doc.
3. feast-dev/feast #6081 -- 2026-03-16 -- Claude Code agent skills for Feast.
4. awslabs/mcp #2607 -- 2026-03-09 -- Kendra docs menu fix.
5. cloudposse/terraform-aws-tfstate-backend #197 -- 2026-03-24 -- S3 native locking docs.
6. awslabs/agent-plugins #132 -- 2026-04-30 -- defusedxml extension guard.
7. awslabs/agent-plugins #212 -- 2026-07-08 -- quote CLAUDE_PLUGIN_ROOT in hook commands.
8. lucide-icons/lucide #4512 -- 2026-07-09 -- Vue Icon kebab-case icon-node prop.
9. axios/axios #11059 -- 2026-07-13 -- AxiosError message from AggregateError.errors.
10. expressjs/multer #1426 -- 2026-08-29 -- files skipped by fileFilter no longer consume maxCount.
11. terraform-aws-modules/terraform-aws-atlantis #446 -- 2026-10-08 -- pass service.security_group_egress_rules through to the ECS service security group.

**Co-authored (not counted in the 11):** aws-ia/terraform-aws-vpc #184 -- root-caused the Cloud WAN attachment-replacement bug; fix co-authored into v4.8.0.

**Open:**
- hashicorp/terraform-provider-aws #46867 -- IoT CloudWatch metric substitution validation.

**Closed unmerged (do NOT list):** aws-cdk #37601, mcp/python-sdk #2446, chroma #6590, dspy #9405.

Canonical resume claim: `11 upstream PRs merged`, with a list like `axios, Apache Airflow, lucide, Prefect, Feast, awslabs/mcp, multer, and others`. Do not quote an open-PR count. Never `7 upstream PRs` or `6 merged`; both are stale.

## Coding profiles (RECONCILED)

- LeetCode (verified 2026-10-10): `Guardian badge, 2166 peak rating (current equals peak; LeetCode shows the API's 2165.70 rounded, so never 2165), 1300+ problems (1324 live), 107 contests, top 1.1% of contestants`. Never `Knight`, `2007`, `1200+` or `100+ contests`; all stale. **NEVER 2000+ on LeetCode alone.**
- GeeksforGeeks: `500+ DSA problems` (521 live, 2026-10-10). Never `400+`.
- HackerRank: `6-Star Problem Solving, 5-Star C++`.
- Combined phrasing (only if using it): `1800+ problems across LeetCode + GfG` (1324 + 521; do NOT say 2000+ unless HackerRank problem count is added and verified). Preferred: quote per-platform, no aggregate.
- Portfolio `personal.json.statistics.coding_questions: 2000+` and `about.competitive_programming: "2000+ problems solved across platforms"` -- reduce to `1800+ problems across LeetCode and GeeksforGeeks` OR quote per-platform.

## Competitions

- `Rank 1289 (Top 5%) -- Google Kick Start Round E '22` (Sep 2022). Keep despite Kick Start retirement (2023).
- `Rank 1699 -- Google Kick Start Round B '22` (May 2022) -- drop from resume, keep on portfolio.
- 1st place: Coding Cauldron '23 (NIT Trichy, Mar 2023); QFiesta IGNOSI '22 (NIT Warangal, Dec 2022).
- 2nd place: Manage the Damage '23 (NIT Trichy); Trial By Code IGNOSI '22.

## Featured projects (7+/10 bar)

Ranked by role fit and recency. Each variant may re-rank. All descriptions ~one line + tech stack + link.

1. **Ledger Sync** (Jan 2026) -- Personal-finance transaction reconciler. TypeScript/React/FastAPI/SQLite. 26 pages (not 23); AI chatbot with 15 read-only tool calls. https://sagargupta.online/ledger-sync/
2. **GitScope** (Mar 2026) -- Chrome extension for GitHub repo insights. JS/Manifest V3/GitHub GraphQL/Cloudflare Workers. https://chromewebstore.google.com/detail/gitscope/fndaanihifimmlnmkjdmjbbkbdajolff
3. **Claude Cost Optimizer** (2026) -- Save 30--60% on Claude costs. https://sagargupta.online/claude-cost-optimizer/
4. **Bedrock Multi-Model MCP** -- Route through 500+ Bedrock models via one MCP server.
5. **LeetCode Rating Predictor** (Dec 2023) -- Python/React/FastAPI/TensorFlow/GraphQL. Training set: **121K+ contest records, test MAE ~7.8 rating points**. Pick 121K+ everywhere; `244K+` and `MAE ~14` are stale. Do not quote test counts (the repo disagrees with itself); say `backend and frontend test suites`. https://leetcode-rating-predictor.onrender.com/
6. **Instagram Likes Leaderboard** (Feb 2026) -- TypeScript/Preact/Browser API. Currently absent from resume; add to `Other Notable Projects` line.
7. **Blue-Green AWS Terraform** (Jul 2025) -- Terraform/ECS on EC2/ALB/CodePipeline, 15 Terraform modules. Runs on an EC2 Auto Scaling Group of container instances, NOT Fargate; never `18 modules`.
8. **Claude Skills Marketplace** -- Claude Code plugin marketplace, 16 plugins (not 25).
9. **SelfHub** (Mar 2025) -- MCP server + MongoDB.

## Section-order canon (all 9 variants uniform, homogenized in commit 953843c)

`Summary -> Experience -> Certifications -> Education -> Projects -> Open Source -> Skills -> Achievements`. Bigtech inserts `Talks & Publications` between Skills and Achievements. Fix CLAUDE.md line 68 (stale SDE claim) and match across README.

## Banned phrases (voice principles, non-negotiable)

`leverage`, `synergy`, `empower`, `unlock`, `velocity` (as noun without metric), `unblocking`, `compressing manual review cycles`, `AI-driven` (without measured deliverable), `end-to-end` (cap at ONE use per PDF), `significantly`, `world-class`, `cutting-edge`, `robust`, `seamless`. Every bullet: `action verb + measurable outcome + technology`. If a number is not available, drop the phrase.

## Paper size

- Global: A4 (as per CLAUDE.md).
- Exception: `bigtech` variant uses `letterpaper` (FAANG US-recruiter default).
