# Today — Sat 12 Sep 2026

Week 2 runs **Mon 14 – Sun 20 Sep**. Ordered by when it has to be done.
Backlog lives in `_todo.md`; lab tracker in `_labs.md`.

---

## Done for you already this morning

- [x] Friday's Zoom recording is wired to `lecture-02` and the Sep 9 one to
      `lecture-01`. (Your forward was HTML-only, which the fetcher couldn't
      read — fixed, so `python3 _scripts/add-recording.py --write` works
      unattended from now on.)
- [x] Added the **Homework** assessment set to `pl-ubc-dsci220/infoCourse.json`.
      HW1 was blocked on this; it isn't now. Committed and pushed.
- [x] Recording slot moved off Wednesday — see below.

## Marko pushed while you were away

Pulled just now (`225c3ce`). He added:

- **`tutorial1-logic-2026W1` — Lab 1 exists.** 7 questions in 3 zones:
  Functional Completeness (×3), NaN equivalence, Tautologies and
  Contradictions (×3). All 7 question ids resolve. **You do not have to build
  this.**
- **Practice sets for weeks 2, 3, 4, 5, 6, 8, 9, 10.**
- A batch of Week 4 direct-proof questions (dropdowns, fix-the-mistake).

⚠️ **Lab 1's `accessControl` is `[]`** — no release date, so students can't
open it, and it runs Tuesday 2pm. This is the one thing standing between Lab 1
and working. Tell me the window and I'll set it; the model is `class1-truth`,
which uses `release` / `due` / `afterLastDeadline: credit 0`. Tutorials are 10%
and graded, so it presumably wants a due date well after the lab ends, not at
the end of the session.

---

## Must land before Monday 11:00

- [ ] **Lecture 3 deck.** Two candidates, and you want pieces of each — see
      "Choosing lecture 3" at the bottom. Decide, then I'll assemble it.
- [ ] **Lecture 3 has a dead PrairieLearn link** (`course_instance/186238`,
      last year's) on lines 343 and 345. Lecture 4 line 51 and lecture 16
      line 88 have the same problem. Fix when the deck is settled.

## Must land before Tue 14:00 (Noah's lab, first one of the term)

- [ ] **Set Lab 1's access window** — see above. Without it students can't
      open the assessment.
- [ ] **Review Marko's Lab 1** — 7 questions for a 2-hour session. Is that the
      right amount, and is Functional Completeness the right opener given class
      has only reached WFFs?
- [ ] Put Lab 1's URL in `data/additional-resources.csv` — the
      `tutorial-01,activity` row still reads `TBD`, so the schedule's Tutorial
      column is greyed out.
- [ ] Tell the TAs where Lab 1 is and what they're running.

## Must land before Wed 11:00

- [ ] **Lecture 4 deck** (Wed 16 Sep) — review, and strip the dead PL link.

## Must land before Fri

- [ ] **Record the first async video** (`lecture-05`, Fri 18 Sep). This is the
      first of 13 and nobody is named to help yet.
      **New slot: Thursday 10:00–11:00.** Wednesday is gone — 11–12 your class,
      1–3 Marko's lab, 3–4 your other class, 4:30–5:30 your other recording.
      Thursday is clear for all four of you.

## Must land before Sun 20 Sep

- [ ] **HW1 — it does not exist.** Due Sunday. No longer blocked; build the
      assessment, then fill in `homeworks/homework-01_homework.qmd`, which is
      still a stub saying "complete it on PrairieLearn". Marko's new practice
      sets for weeks 2–4 are the obvious source of questions.

---

## People — this week

- [ ] **Book the weekly staff meeting.** Proposed **Mon 12:00–1:00** — right
      after class, before Noah's Tue 2pm lab, so a lab can still be fixed.
      Free for all four. Nobody has been asked yet.
- [ ] **Assign lab owners.** Six of ten labs are new builds; only Lab 1 has an
      owner (you). `_labs.md` has the tracker.
- [ ] **Re-home L1C's 5 students.** L1D full, L1A has 2 spaces, L1B has 9 — so
      3 of the 5 must take Tue 4–6.
- [ ] **Who helps with the video.** 13 of them, nobody named.
- [ ] **Report the scrolling bug** from giving Marko student-data access, while
      it's still fresh.

## Decide when convenient

- [ ] **Sep 30 / Tutorial 3.** Truth and Reconciliation falls on week 4's
      Wednesday. L1A is now the only Wednesday section, so Marko's 24 students
      get 9 tutorials to everyone else's 10. Skip it for all, run it async for
      L1A, or leave that week out of assessment.
- [ ] **Course part titles.** Live site still says "Part 1/2/3, Topic to be
      decided".
- [ ] Final exam date. DSCI Instagram handle (Jayden's).

---

## Choosing lecture 3

There is **no git conflict** — nothing to resolve, and the file on disk is
clean. What you have is two separate files:

| File | Size | What it is |
|---|---|---|
| `slides/lecture-03_slides.qmd` | 399 lines | Last year's deck, ported |
| `slides/draft-03_slides.qmd` | 309 lines | The data-science-angled rewrite |

If VS Code offered you a "conflict", it was comparing your unsaved buffer
against the file on disk — not git. Saving or discarding the buffer clears it.

**Only in the ported deck** — WFFs (×3, incl. the theorem), WFF Puzzle,
Back to Propositions, Translation, Implication, Special Logical Equivalences.
*Note the WFF slides are already in lecture 2, so they'd be a repeat.*

**Only in the rewrite** — One predicate many rows, The same column in pandas,
A claim about the data, Two ways to settle it, Now change one thing, Back to
the mask, Where it breaks.

**In both** — Predicates, Boolean Masks, Logical Equivalence, Logical
Equivalence example, Logical Equivalences, Words and Ideas.

Tell me which slides you want and I'll build the deck. The fastest version of
that answer is probably: *"rewrite, plus Implication and Special Logical
Equivalences from the old one"* — but that's your call, not mine.
