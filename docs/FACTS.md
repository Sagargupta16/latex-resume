# Canonical facts (source of truth for all 9 variants + portfolio)

Every disputed number in the audit reconciled here. If a variant or portfolio JSON disagrees, edit them, never this file. INFO.md remains the long-form reference; this file is the short truth table for numeric claims that recruiters check.

Reconciled 2026-07-03 from INFO.md + Credly + verified PR data. Certifications, open source, coding profiles and project numbers re-verified live 2026-10-10, and again 2026-10-18 for the section rework (Credly, `gh api`, each repo's README on main, npm downloads API).

## Identity

| Field | Canonical value |
|---|---|
| Full name | Sagar Gupta |
| Job title on resume | `ProServe (Cloud Consultant) - DevOps/MLOps` (set by Sagar 2026-10-14; use this exact string on every surface) |
| Summary headline (2026-10-18) | The target job title in bold, then `with 2 years at AWS Professional Services as ProServe (Cloud Consultant) - DevOps/MLOps`. Headlines: general `Cloud & DevOps/MLOps Engineer` (INFO.md bio), devops `DevOps Engineer`, cloud `Cloud Engineer`, mlops `MLOps Engineer`, aiml `ML Engineer`, platform `Platform Engineer`, sde `Software Engineer (full-stack)`, ai-tools `AI Tools & Developer Productivity Engineer`, bigtech `Software Engineer` (bigtech puts the competitive-programming line between the headline and the `Two years at AWS Professional Services as ...` clause). Never `Senior DevOps Consultant` or `Cloud Consultant at AWS` as his title. |
| Job title on portfolio | `ProServe (Cloud Consultant) - DevOps/MLOps at AWS` (`@ AWS` in short labels) |
| Employer | Amazon Web Services (AWS), Professional Services |
| Internal title (do NOT show externally) | Associate Delivery Consultant, ProServe DC |
| Location | Bengaluru, India (since 2026-10-14). The AWS internship (Mar -- Jul 2024) stays `Hyderabad, India`. |
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
- No confirmed metric exists, so since 2026-10-18 the resume line is one rendered line on every variant: `Modernized legacy Terraform to cloud-native IaC with Amazon Q.` (sde: `Refactored`, per INFO.md). Never `S3 native locking`, `policy-as-code checks`, `refactored monoliths into reusable modules`, `standardizing state, provider, and module patterns`, `modular` or `across the estate`: none of them is in the engagement record.
- IMPORTANT: DTCC MUST appear in every variant that lists RWS + State Street (all 9 do, checked 2026-10-18); dropping it leaves a 6-month gap Aug 2025 to Feb 2026.

### Internal impact (roll into experience or extract to Talks section)

- APG pattern `Secure PR Previews and Approval-Gated Releases for Amplify Gen 2 with GitHub` (2025, co-authored with Abhigyan Dandriyal per INFO.md). **NOT found on the public site on 2026-10-18**: none of the 464 live pattern pages in `docs.aws.amazon.com/prescriptive-guidance/latest/patterns/toc-contents.json` has this title or his name in a byline, and only 5 Amplify patterns exist. Resume wording is `Co-authored an AWS Prescriptive Guidance pattern on secure PR previews and approval-gated releases for Amplify Gen 2`, inside the Experience Internal Impact bullet only. Never `Published APG pattern` until Sagar supplies the public URL; then it can move into Publications.
- `plus 2 more peer-reviewed in publication pipeline`: dropped 2026-10-18. Not public, and the count disagrees with the portfolio (`3 APG Patterns Peer Reviewed`).
- No AWS blog post by Sagar exists yet (AWS blog directory search, 2026-10-18). The SageMaker healthcare MLOps blog (INFO.md) is unpublished; add it only once live.
- MLOps SME Program Graduate (2025).
- 5x TFC Ambassador: `AI/ML, NGDE (Graduated), CloudOps (AWS DevOps Agent), Agentic AI, Serverless`. Portfolio's `4x` is stale -- fix to 5x. INFO.md line 314 (`4x`) is also stale -- fix to 5x.
- 2 org-wide tech talks: Terraform testing (2025); GitOps pipeline gating (2026).
- Associate Speaker Certified (2026).
- MLOps Pipeline (SME Program, Jun-Aug 2025): SageMaker medical image classification, blue-green endpoints, drift detection.

## Published AWS samples (verified 2026-10-18 against each repo's main branch)

Both are listed in the `Publications & Recognition` section (bigtech: `Publications & Talks`) as `Published by AWS: aws-samples/<repo> (author, MIT-0)`. Authorship: `xsagarx-aws` (commit author `Sagar Gupta`) is the only human committer on both (`gh api repos/aws-samples/<repo>/contributors`). Never quote their star counts (4 each; aws-samples has 9,000+ public repos). The Experience MLOps bullet keeps the first sample's link; the second sample is only referenced there (`see Publications`), so neither is listed twice in full.

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
| 5 | AWS Certified Cloud Practitioner | May 2024 | Jan 2029 |

Expired: HashiCorp Certified: Terraform Associate (003), issued Sep 2024, expired 2026-09-10. It is off every variant. Canonical claim is `5x AWS certified`; never `6x` or `AWS/HashiCorp certified`.

Note (corrected 2026-10-18): Credly's `badges.json` shows Cloud Practitioner expiring `2029-01-31`. Passing Developer Associate on 2026-01-31 renewed it, so the portfolio JSON value was right and the old `2027-05-02` note here was stale.

Also on Credly (not an AWS cert, so the count stays `5x AWS certified`): `Claude Partner Badge - Claude Code`, issuer Anthropic, issued 2026-09-23, expires 2027-03-23, public, badge https://www.credly.com/badges/5e4ea6eb-b781-4c83-a0f1-231e2b92e777 (re-checked 2026-10-18 via `https://www.credly.com/users/sagar-gupta.f8eb96cc/badges.json`; the profile handle is `sagar-gupta.f8eb96cc`, `sagar-gupta.6c9fd6e2` returns "Resource not found"). On `ai-tools` only since 2026-10-18, as `Anthropic badge: Claude Partner Badge - Claude Code (Sep 2026)` on the certifications line; the heading stays `Industry Certifications (5)`.

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

**Resume section shape (2026-10-18):** header `Open Source Contributions (11 merged upstream)`, then the top 5 behavior fixes with one impact line each, then one `Also merged` line: Prefect, Feast, awslabs/agent-plugins (#132, #212), awslabs/mcp, cloudposse tfstate-backend, and co-author of the aws-ia/terraform-aws-vpc v4.8.0 fix. Top 5 order: axios, Airflow, lucide, multer, atlantis (devops, cloud and platform lead with atlantis; mlops and aiml lead with Airflow). Prefect, Feast, awslabs/mcp and cloudposse are docs or skill-file PRs, so they stay in the comma line. The open terraform-provider-aws #46867 is off every variant.

- Star counts (live 2026-10-18): axios 109K, Airflow 47K, lucide 25K, Prefect 24K, multer 12K, awslabs/mcp 9.8K, Feast 7.3K (never `9K`), atlantis 557.
- agent-plugins #132 only moves the defusedxml dependency check after the file-extension check, ending a spurious warning on every Edit/Write. It is **not** a security or XXE fix; never `guard` or `XXE`.
- Linked issues: axios closes #6721; lucide closes #3485 (a TypeError crash); multer fixes #1419; atlantis closes #444 (v5 replaced custom egress rules with a hardcoded allow-all).

## Coding profiles (RECONCILED)

- LeetCode (verified 2026-10-10): `Guardian badge, 2166 peak rating (current equals peak; LeetCode shows the API's 2165.70 rounded, so never 2165), 1300+ problems (1328 live on 2026-10-18), 107 contests, top 1.1% of contestants`. Never `Knight`, `2007`, `1200+` or `100+ contests`; all stale. **NEVER 2000+ on LeetCode alone.**
- GeeksforGeeks: `500+ DSA problems` (521 live, 2026-10-10). Never `400+`.
- HackerRank: `6-Star Problem Solving, 5-Star C++`.
- Combined phrasing (only if using it): `1800+ problems across LeetCode + GfG` (1324 + 521; do NOT say 2000+ unless HackerRank problem count is added and verified). Preferred: quote per-platform, no aggregate.
- Portfolio `personal.json.statistics.coding_questions: 2000+` and `about.competitive_programming: "2000+ problems solved across platforms"` -- reduce to `1800+ problems across LeetCode and GeeksforGeeks` OR quote per-platform.

## Competitions

- `Rank 1289 -- Google Kick Start Round E '22` (Sep 2022). Never `Top 5%`: the certificate shows the rank only and the round's participant count is not on record (re-checked 2026-10-18). On `sde` and `bigtech` only since 2026-10-18. Certificate link: `https://github.com/Sagargupta16/Sagargupta16/blob/main/certificates/google_kickstart_2022-09.pdf` (the old `Certificates/Google-KickStart-September-2022.pdf` path returns 404).
- `Rank 1699 -- Google Kick Start Round B '22` (May 2022) -- drop from resume, keep on portfolio.
- College fest results (1st Coding Cauldron '23 and QFiesta IGNOSI '22; 2nd Manage the Damage '23 and Trial By Code IGNOSI '22; 3rd Logic Head '22 and MOTHRA '21; 4th TriNIT Hackathon): **off every variant since 2026-10-18**, kept on the portfolio. At 2 years into an AWS role they read as dated detail next to AWS-published samples and merged upstream fixes.
- NIMCET AIR 208 and CGPA live on the Education line only, not in a separate section.

## Featured projects (7+/10 bar)

Ranked by role fit and recency. Each variant may re-rank. All descriptions ~one line + tech stack + link. Re-measured 2026-10-18 against each repo's README and CHANGELOG on main.

1. **Claude Cost Optimizer** (Mar 2026) -- Claude Code plugin, MCP cost server (`mcp-cost-server`), CLI grader (`claude-rate`) and web calculator. Cache-aware billing corrected a modelled 30-turn Opus 5.5 session from `$3.44 to $0.74` (CHANGELOG); golden-value tests in all three implementations (27 vitest, 13 unittest, 5 node:test). 38 stars, the most of any own repo. **Never `30-60%`**: the README says no typical saving has been published, so the repo quotes none (its GitHub description still says `Save 30-60%` and needs fixing). https://sagargupta.online/claude-cost-optimizer/
2. **LeetCode Rating Predictor** (Dec 2023) -- Python/TensorFlow/NumPy/FastAPI/React. 15 engineered features. Fixed a participant-count train/serve skew that had tripled backtest error: `MAE 38.76 to 12.46 on 57 contests`. NumPy-only serving, runtime `~1.8 GB to ~65 MB`, pinned by a golden test. Weekly data refresh re-runs the backtest. **Never `MAE ~7.8` or `121K+ records` as the headline**: the README retired the 7.84 figure because it came from a random record split that leaks users. Current numbers if needed: held-out users MAE 14.14; recent-contest backtest MAE 9.11 and 7.58 on two 50-user samples (model 2.4.0). https://leetcode-rating-predictor.onrender.com/
3. **Blue-Green AWS Terraform** (Jul 2025) -- 15 Terraform modules (plus bootstrap and tests), ECS on an EC2 Auto Scaling Group, NOT Fargate. CodeDeploy `TimeBasedCanary` 30% for 1 minute with rollback on a 5xx spike or unhealthy target; 80% coverage gate in CodeBuild; 8 `.tftest.hcl` files with `tests/mocks/aws.tfmock.hcl`; Checkov and tflint in CI. Never `18 modules` (the GitHub description still says 18).
4. **Bedrock Multi-Model MCP** (Apr 2026) -- 26 text models from 7 providers, 3 image, 1 video, 5 embedding models, 8 tools. Benchmark 2026-10-18 in us-east-1: 26 of 26 models answered, 156 of 156 calls succeeded. **Never `500+ models`.** Not on npm.
5. **itr-agent** (Jul 2026) -- Local-first MCP server for Indian income tax: 12 tools + a `file_my_itr` prompt; the LLM never does arithmetic, a deterministic engine over a versioned JSON rule pack computes every number. 151 tests; CI matrix ubuntu + windows x Node 22/24/26 (green on main 2026-10-18). npm still serves 0.3.0 (the v0.5.1 publish failed), so never claim an npm or MCP registry listing or users.
6. **skillcheck** (Jul 2026) -- Agent Skills conformance linter: 36 rules with skills-ref parity, SARIF 2.1.0, GitHub Marketplace action. `284 npm downloads in the last month` (api.npmjs.org, 2026-09-17 to 2026-10-16; re-measure before reuse). Do not claim runtime trigger tests or a compatibility matrix (the repo description promises them; they do not exist yet).
7. **Kinfolk** (Jul 2026) -- Collaborative family graph (a DAG, consent links between owners). Next.js 16, React 19, Drizzle on Neon. Live: https://kinfolk-neon.vercel.app/ (`/api/health` returned `ready`, v0.5.0, 2026-10-18). Featured on sde and bigtech only.
8. **Ledger Sync** (Jan 2026) -- Self-hosted personal-finance app. TypeScript/React/FastAPI/SQLite. 26 pages (not 23); `.xlsx/.xls/.csv` imports with SHA-256 transaction IDs (idempotent re-imports); AI assistant with 15 read-only tool calls. Never `CSV/OFX` or `fuzzy-match dedup`. https://sagargupta.online/ledger-sync/
9. **GitScope** (Mar 2026) -- Chrome extension for GitHub profile insights. JS/Manifest V3/GitHub GraphQL/Cloudflare Workers. https://chromewebstore.google.com/detail/gitscope/fndaanihifimmlnmkjdmjbbkbdajolff
10. **Instagram Likes Leaderboard** (Feb 2026) -- TypeScript/Preact/Browser API. `Other Notable Projects` line. A browser-console tool (README), never `browser extension`.
11. **Claude Skills Marketplace** -- Claude Code plugin marketplace, 16 plugins (not 25). Every plugin ships a skill; only dev-workflow, git-advanced and oss-contrib also have commands, agents and hooks, so never `each with slash commands, agents, and hooks`.

Off every variant (re-checked 2026-10-18): **StockSage AI** (the README says it is a Phase 1 scaffold with empty placeholder files; `lstm_model.py` is 0 bytes, so never claim an LSTM forecaster). **DevOps-AWS-FARM** has no Terraform (0 `.tf` files); describe it only as `Docker + GitHub Actions OIDC deploy to ECR/ECS`. **Instagram Autopilot** posts animated SVG Reels; Bedrock writes the topic and caption text only, so never `Bedrock image and video generation`.

SageMaker skills rows say `Custom PSI drift jobs`, never `Model Monitor` (see the MLOps sample section). HackerRank is written `6-Star` on every variant.
12. **SelfHub** (Mar 2025) -- MCP server + MongoDB.

Placemento lives at https://github.com/MCA-NITW/placemento (live: placemento.onrender.com); the old `Sagargupta16/Placemento-...` URL is a 404. It is off every variant for now; whether sde lists it again is Sagar's call. Code Arena's live demo is frontend-only; describe it as a frontend.

General picks (2026-10-18): Claude Cost Optimizer, LeetCode Rating Predictor, Blue-Green AWS Terraform, Bedrock Multi-Model MCP, itr-agent; Other line: Ledger Sync, GitScope, skillcheck, Kinfolk, Instagram Likes Leaderboard.

## Section-order canon (all 9 variants uniform, homogenized in commit 953843c)

`Summary -> Experience -> Publications & Recognition -> Certifications -> Projects -> Open Source -> Education -> Skills` (reordered 2026-10-18: Publications moved up next to Experience, Education moved below Projects and Open Source). `Publications & Recognition` is `achievements.tex`: the two aws-samples repos plus one LeetCode line (sde adds Kick Start). Bigtech puts `Publications & Talks` (`talks.tex`: the two samples plus internal talks and programs, labelled `AWS internal`) in the slot after Experience via `\variantPublications`, and its `achievements.tex` (`Competitive Programming`) goes last, after Skills, via `\variantExtraSections`. Renamed from `Achievements` on 2026-10-18.

## Banned phrases (voice principles, non-negotiable)

`leverage`, `synergy`, `empower`, `unlock`, `velocity` (as noun without metric), `unblocking`, `compressing manual review cycles`, `AI-driven` (without measured deliverable), `end-to-end` (cap at ONE use per PDF), `significantly`, `world-class`, `cutting-edge`, `robust`, `seamless`. Every bullet: `action verb + measurable outcome + technology`. If a number is not available, drop the phrase.

## Paper size

- Global: A4 (as per CLAUDE.md).
- Exception: `bigtech` variant uses `letterpaper` (FAANG US-recruiter default).
