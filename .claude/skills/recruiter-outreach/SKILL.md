---
name: recruiter-outreach
description: Use when Sagar wants a message drafted to a recruiter, hiring manager, or for a referral -- LinkedIn DM, cold email, recruiter reply, or referral ask. Triggers on "draft a LinkedIn message to this recruiter", "cold email for this role", "referral ask", "reply to this recruiter", "reach out about this job". Writes short, specific, voice-matched outreach tied to a target role and the right resume variant.
---

# Recruiter / referral outreach

Drafts short, human, specific outreach messages in Sagar's voice. Plain text, not LaTeX -- these are sent in LinkedIn / email, not compiled.

## Hard rules

- **Facts only from [INFO.md](../../../INFO.md).** Title, employer (AWS Professional Services), certs, OSS, metrics. Never inflate.
- **Voice:** read [voice-principles.md](../../../../../.claude/resources/voice-principles.md). Lead with the point. No throat-clearing, no "I hope this message finds you well", no buzzwords, no em-dashes (`--`), no emojis. Confident, not desperate.
- **Length by channel:** LinkedIn connection note <= 300 chars; LinkedIn DM 3-5 sentences; cold email 4-6 sentences with a subject line that is the ask.
- **One clear ask per message** (a call, a referral, "are you the right person"). Never multiple.
- **Pick the matching resume variant** to attach/link, using the `tailor-variant` matrix. Mention which one.

## Steps

1. **Get the target.** Role title, company, and recipient (recruiter / hiring manager / someone for a referral). If replying to an inbound message, read it first and match its register.
2. **Pick the angle.** Map the role to the strongest 1-2 true credentials for it (e.g. for a platform role: Terraform module library adopted org-wide + 1000+ security controls; for AI tooling: Claude Code skills + MCP OSS PRs).
3. **Draft by channel:**
   - **LinkedIn connection note:** one line of relevance + soft ask. Under 300 chars.
   - **LinkedIn DM / InMail reply:** open with the specific role + why he's a fit (1 sentence, 1 metric), then the ask.
   - **Cold email:** subject = the ask ("DevOps Consultant -- referral question"); body = who he is in one line, the specific fit in two, the ask in one, link to resume + portfolio.
   - **Referral ask (to someone he knows):** acknowledge the relationship, name the exact role/req, make the ask easy ("would you be comfortable referring me / pointing me to the right person").
4. **Attach the right asset.** Link the `latest` release for general, or the `raw.githubusercontent.com/.../builds/resume-<slug>.pdf` URL for a variant. Include portfolio (sagargupta.online/portfolio-react/) when space allows.
5. **Offer 2 variations** (a warmer one and a more direct one) so Sagar can pick.

## Notes

- Don't propagate Sagar's chat typos into the draft -- ship clean copy.
- Never send anything; output the draft for Sagar to review and send himself.
- For a full application package, chain: `tailor-variant` (resume) -> `cover-letter` -> this skill (the intro message).
