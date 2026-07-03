# Canonical facts (source of truth for all 9 variants + portfolio)

Every disputed number in the audit reconciled here. If a variant or portfolio JSON disagrees, edit them, never this file. INFO.md remains the long-form reference; this file is the short truth table for numeric claims that recruiters check.

Reconciled 2026-07-03 from INFO.md + Credly + verified PR data.

## Identity

| Field | Canonical value |
|---|---|
| Full name | Sagar Gupta |
| Job title on resume | `Cloud Consultant -- Professional Services (DevOps/MLOps)` |
| Job title on portfolio | `Cloud Consultant -- Professional Services (DevOps/MLOps) at AWS` |
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

- Role framing: `Lead DevOps Consultant -- RWS (sole DevOps consultant)`. Every variant that mentions RWS must include `Lead DevOps Consultant`; `sole DevOps consultant` is optional adjective, but if used, use in ALL variants that mention RWS.
- Scale: `50+ application workloads into 135+ AWS accounts`. Both numbers together, always. Never `135+ accounts` alone.
- Automation gain: `Terraform + GitHub Actions cuts infrastructure setup time by ~90% versus manual account provisioning`. Attach a directional baseline every time it appears: `weeks to days` or `3+ days per account to under 4 hours`. No naked `~90%` -- the audit flagged that as unverifiable metric shape.
- Networking scope: Transit Gateway hub-and-spoke, VPN/Direct Connect hybrid connectivity, centralized egress inspection. Include in `cloud`, `devops`, `platform`, `general`, `bigtech`. Optional in `mlops`, `aiml`, `ai-tools`, `sde`.
- Governance scope: Preventative SCPs, tag policies, AWS Config rules, Security Hub standards, CCMv4-aligned. Include everywhere RWS appears.
- Kiro mention: `Kiro for AI-driven requirement analysis, architecture documentation, and implementation specs`. Include in `general`, `ai-tools`, `platform`. Optional elsewhere.
- Recognition (private, do not put on resume): 2x 5-Star Pulse, 2x 25 Peculiar Points.

### State Street (Oct 2024 -- Aug 2025)

- Role: `DevOps Consultant`.
- Scope claim (RECONCILED): `38+ service self-service Terraform module library, adopted by application teams as the client's cloud-platform standard`. Do NOT say `entire cloud estate` -- INFO.md line 74 says `across the client's entire cloud platform`, so use `client's cloud-platform standard adopted across application teams` uniformly.
- CCMv4.0: `Architected 1000+ preventative Config/Security-Hub controls mapped to CCMv4.0 compliance`. Use `Config/Security-Hub controls` -- names the unit (audit flagged the naked `1000+`).
- Testing: `tftest + PyTest`.
- Delivery signal: `10/10 CSAT, 3x consecutive 5/5 Pulse ratings`.

### DTCC (Aug 2025 -- Dec 2025)

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

## Earlier roles

- `Associate Professional Services -- DevOps (Internship)`, AWS, Mar 2024 -- Jul 2024.
- `Software Developer Associate (Internship)`, Ikarus-3D, May 2023 -- Jul 2023.

## Education

- MCA, NIT Warangal: `Sep 2021 -- Jul 2024`. CGPA 8.38. NIMCET AIR 208. First Division with Distinction. (INFO.md is authoritative -- current resume `Aug 2021 -- Jun 2024` is off by one month on both ends.)
- BCA, DAVV Indore: `May 2018 -- Aug 2021`. CGPA 7.34. (Current resume `Jun 2018 -- Jun 2021` is wrong on both ends.)

## Certifications (6 industry)

Ordered by relevance to primary target role (Cloud/DevOps/MLOps). Match badge IDs from Credly.

| # | Name | Issued | Expires |
|---|---|---|---|
| 1 | AWS Certified Solutions Architect -- Associate | Jul 2024 | Jul 2027 |
| 2 | AWS Certified Developer -- Associate | Jan 2026 | Jan 2029 |
| 3 | AWS Certified Machine Learning Engineer -- Associate | Jun 2025 | Jun 2028 |
| 4 | AWS Certified AI Practitioner | Jul 2025 | Jul 2028 |
| 5 | AWS Certified Cloud Practitioner | May 2024 | May 2027 |
| 6 | HashiCorp Certified: Terraform Associate (003) | Sep 2024 | Sep 2026 |

Note: Cloud Practitioner expiry in portfolio JSON was `2029-01-31` -- that is Developer Associate's expiry, not Cloud Practitioner's. Fix to `2027-05-02` (3-year standard).

Optional resume additions from learning badges: `Well-Architected Proficient (Jan 2026)`, `AWS AI-DLC Ambassador L100 (Jun 2026)`. Both are current and role-relevant.

## Open source (RECONCILED, verified 2026-06-18)

**Merged (6):**
1. Apache Airflow #63109 -- 2026-03-23 -- template_fields on SalesforceBulkOperator.
2. PrefectHQ/prefect #20956 -- 2026-03-04 -- deployment-steps-as-Python doc.
3. feast-dev/feast #6081 -- 2026-03-16 -- Claude Code agent skills for Feast.
4. awslabs/mcp #2607 -- 2026-03-09 -- Kendra docs menu fix.
5. cloudposse/terraform-aws-tfstate-backend #197 -- 2026-03-24 -- S3 native locking docs.
6. awslabs/agent-plugins #132 -- 2026-04-30 -- defusedxml extension guard.

**Open (1):**
- hashicorp/terraform-provider-aws #46867 -- IoT CloudWatch metric substitution validation.

**Closed unmerged (do NOT list):** aws-cdk #37601, mcp/python-sdk #2446, chroma #6590, dspy #9405.

Canonical resume claim: `6 upstream PRs merged (Airflow, Prefect, Feast, awslabs/mcp, cloudposse/terraform-aws-tfstate-backend, awslabs/agent-plugins), 1 open (terraform-provider-aws)`. Portfolio `personal.json.statistics.open_source_prs: 13+` is misleading -- 6 upstream merged + 1 open = 7 verified. Change portfolio to `7 upstream OSS PRs` (or `6 merged`).

## Coding profiles (RECONCILED)

- LeetCode: `1200+ problems, 2007 peak (Knight), 100+ contests`. **NEVER 2000+ on LeetCode alone.**
- GeeksforGeeks: `400+ DSA problems`.
- HackerRank: `6-Star Problem Solving, 5-Star C++`.
- Combined phrasing (only if using it): `1600+ problems across LeetCode + GfG` (do NOT say 2000+ unless HackerRank problem count is added and verified). Preferred: quote per-platform, no aggregate.
- Portfolio `personal.json.statistics.coding_questions: 2000+` and `about.competitive_programming: "2000+ problems solved across platforms"` -- reduce to `1600+ problems across LeetCode and GeeksforGeeks` OR quote per-platform.

## Competitions

- `Rank 1289 (Top 5%) -- Google Kick Start Round E '22` (Sep 2022). Keep despite Kick Start retirement (2023).
- `Rank 1699 -- Google Kick Start Round B '22` (May 2022) -- drop from resume, keep on portfolio.
- 1st place: Coding Cauldron '23 (NIT Trichy, Mar 2023); QFiesta IGNOSI '22 (NIT Warangal, Dec 2022).
- 2nd place: Manage the Damage '23 (NIT Trichy); Trial By Code IGNOSI '22.

## Featured projects (7+/10 bar)

Ranked by role fit and recency. Each variant may re-rank. All descriptions ~one line + tech stack + link.

1. **Ledger Sync** (Jan 2026) -- Personal-finance transaction reconciler. TypeScript/React/FastAPI/SQLite. https://sagargupta.online/ledger-sync/
2. **GitScope** (Mar 2026) -- Chrome extension for GitHub repo insights. JS/Manifest V3/GitHub GraphQL/Cloudflare Workers. https://chromewebstore.google.com/detail/gitscope/fndaanihifimmlnmkjdmjbbkbdajolff
3. **Claude Cost Optimizer** (2026) -- Save 30--60% on Claude costs. https://sagargupta.online/claude-cost-optimizer/
4. **Bedrock Multi-Model MCP** -- Route through 500+ Bedrock models via one MCP server.
5. **LeetCode Rating Predictor** (Dec 2023) -- Python/React/FastAPI/TensorFlow/GraphQL. Training set: **244K+ contest records, MAE ~14**. Pick 244K+ everywhere. https://leetcode-rating-predictor.onrender.com/
6. **Instagram Likes Leaderboard** (Feb 2026) -- TypeScript/Preact/Browser API. Currently absent from resume; add to `Other Notable Projects` line.
7. **Blue-Green AWS Terraform** (Jul 2025) -- Terraform/ECS Fargate/ALB/CodePipeline.
8. **SelfHub** (Mar 2025) -- MCP server + MongoDB.

## Section-order canon (all 9 variants uniform, homogenized in commit 953843c)

`Summary -> Experience -> Certifications -> Education -> Projects -> Open Source -> Skills -> Achievements`. Bigtech inserts `Talks & Publications` between Skills and Achievements. Fix CLAUDE.md line 68 (stale SDE claim) and match across README.

## Banned phrases (voice principles, non-negotiable)

`leverage`, `synergy`, `empower`, `unlock`, `velocity` (as noun without metric), `unblocking`, `compressing manual review cycles`, `AI-driven` (without measured deliverable), `end-to-end` (cap at ONE use per PDF), `significantly`, `world-class`, `cutting-edge`, `robust`, `seamless`. Every bullet: `action verb + measurable outcome + technology`. If a number is not available, drop the phrase.

## Paper size

- Global: A4 (as per CLAUDE.md).
- Exception: `bigtech` variant uses `letterpaper` (FAANG US-recruiter default).
