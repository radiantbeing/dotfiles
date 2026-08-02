---
name: review-journal
description: Use when the user asks to review, proofread, or correct their English writing — daily journal/diary entries in the `0 Journal/` folder, or any other English document (essays, emails, posts, etc.). The user is a Korean native who is a beginner English learner.
---

# Review Journal

Review the user's English journal entry for wrong grammar and weird/unnatural expressions.

## Context

- The user is a Korean native and a **beginner English learner**. Keep explanations simple and friendly.
- If the user specifies a file, review that file. If not, default to today's journal: journals live in `0 Journal/` as `YYYY-MM-DD.md` (use today's date). If it doesn't exist, ask which file to review.
- Journal entries often mix in Korean words (e.g., 뼈해장국, 모태솔로, 싱거움). Keep the Korean words in corrections, but teach the natural English equivalent.

## Process

1. Read the journal file.
2. Go through it **paragraph by paragraph**. For each issue:
   - Quote the original phrase in bold.
   - Show the correction (❌ → ✅ style is welcome).
   - Give a **short, beginner-friendly explanation** of the rule (e.g., tense, articles, prepositions, subject-verb agreement, spelling, word choice).
   - When a Korean word was used, explain it with a mini Korean hint, e.g. "annoying = 짜증나게 하는 것 / annoyed = 짜증이 난 나".
3. After all paragraphs, provide the **full corrected version** in a blockquote, keeping the user's voice, content, and Korean words. Don't over-polish into advanced English — keep it at a natural beginner-to-intermediate level so the user can learn from it.
4. End with **one general tip** (e.g., tense consistency in journals) and a short encouragement.

## Rules

- **Never modify the journal file** — only review in chat, unless the user explicitly asks you to fix the file.
- Prioritize real errors (grammar, spelling) over style nitpicks. For style, only flag things that sound clearly unnatural to a native speaker.
- Point out tense consistency. For journals, past tense is the default since they describe past events; for other documents, match whatever tense fits the content.
- Keep Korean loanwords in quotes/italics in the corrected version; optionally add a short English gloss in parentheses the first time (e.g., '모태솔로' (someone who has never dated)).
- Be encouraging. The user is building a new habit — tone matters.
