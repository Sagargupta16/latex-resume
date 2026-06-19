---
name: interview-prep
description: Use when Sagar has an interview coming up and wants to prepare -- behavioral (STAR) stories from his real experience, system-design practice, or company-specific prep. Triggers on "prep me for the X interview", "behavioral questions for this role", "STAR stories", "system design practice", "interview prep for Google/Amazon/Anthropic", "what will they ask me". Builds answers and drills grounded ONLY in his real history from INFO.md.
---

# Interview preparation

Turns Sagar's real experience into interview-ready material: STAR behavioral stories, system-design drills, and company-specific prep. The resume gets him the screen; this gets him through the loop.

## Hard rules

- **Stories come only from real events in [INFO.md](../../../INFO.md)** -- RWS migration, State Street module library, DTCC refactor, SageMaker MLOps pipeline, OSS PRs, competitions. Never invent a project, metric, conflict, or outcome. If a question needs an example he doesn't have, say so and find the closest real one.
- **Voice for any written answer:** read [voice-principles.md](../../../../../.claude/resources/voice-principles.md). Direct, specific, numbers over adjectives, no buzzwords.
- **Coach, don't script.** Give him the structure and the real material; he delivers it in his words. Flag where he must fill in a detail only he knows (exact numbers, team dynamics).
- This skill produces prep material in chat or a scratch file -- it does NOT edit resume `.tex` files.

## Sagar's real STAR material (source bank from INFO.md)

| Theme | Real story to draw from |
|-------|------------------------|
| Leadership / ownership | Sole DevOps consultant on RWS greenfield migration -- 50+ workloads, landing zone, drove architecture decisions |
| Scale / impact | State Street Terraform module library (38+ services) adopted as platform standard; 10/10 CSAT, 3x 5/5 |
| Dealing with ambiguity | DTCC legacy-to-cloud-native refactor; Amazon Q to accelerate assessment |
| Technical depth | End-to-end SageMaker MLOps pipeline -- blue-green, drift detection, auto-scaling |
| Collaboration / influence | 2 org-wide tech talks; 4x TFC Ambassador; APG pattern peer-reviewed |
| Failure / learning | (Ask Sagar -- needs a real one he's comfortable telling; do not fabricate) |
| Conflict | (Ask Sagar -- pull from a real engagement disagreement) |
| Open source / initiative | Merged PRs to Airflow, Prefect, Feast, awslabs/mcp on his own initiative |
| Perseverance | LeetCode Knight (2007, 1200+ problems); competition wins |

## Steps

1. **Scope the prep.** Ask (if not given): which company, which role, and which round -- behavioral, coding/DSA, system design, or "all". Tailor to that company's known bar:
   - **Amazon/AWS:** 16 Leadership Principles -- map each story to 1-2 LPs explicitly.
   - **Google:** "Googleyness", general SWE behavioral + heavy DSA + system design.
   - **Meta:** "Move fast", impact-focused behavioral.
   - **Microsoft:** collaborative, growth-mindset framing.
   - **Anthropic/OpenAI:** mission alignment, judgment, real-world AI/safety reasoning, less LeetCode-grind, more practical depth.
2. **Behavioral (STAR):** For each likely question, draft Situation-Task-Action-Result using a real story from the bank. Keep Result quantified. Note which competency/LP it demonstrates. Produce 6-10 stories that cover the common themes; many questions reuse the same 6 stories reframed.
3. **System design:** Pick prompts adjacent to his real work for authenticity -- "design a multi-account AWS landing zone", "design a CI/CD platform for 50+ teams", "design an ML inference service with blue-green + drift detection", "design an MCP server / multi-model gateway". Walk requirements -> high-level -> deep-dive -> tradeoffs -> scale. He's done versions of these for real, so anchor on that.
4. **Coding/DSA:** He's strong here (Knight). Recommend a focused topic list by company, not a generic grind. Offer to dry-run 1-2 problems with hints, not full solutions.
5. **Gaps to close:** Honestly name what's weak for the target (e.g. pure distributed-systems design at Google scale, or AI-safety reasoning for Anthropic) and give a short study list.
6. **Mock or flashcards:** Offer to run a mock round (you ask, he answers, you critique against the bar) or output a one-page cheat sheet of his STAR stories.

## Notes

- The "failure" and "conflict" stories are the two most-asked and the two NOT safely inferable from INFO.md -- always ask Sagar for the real event rather than inventing one.
- Pair with `tailor-variant` (resume matched to the JD) and `recruiter-outreach` (the intro) for the full pipeline: outreach -> resume -> interview.
- Keep mock-interview feedback concrete: what landed, what rambled, where a number was missing.
