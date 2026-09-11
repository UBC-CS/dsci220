# DSCI 220 2026W1 — to do

Not published (Quarto ignores `_`-prefixed files).

## Before class

- [ ] **Check Packet 12's fact slip.** If it says *"all spade cards are even"*,
      swap it — the only spade is Q♠ and a Queen is neither even nor odd. This
      is the only real defect in the set.
- [ ] Tell them roles come from the **colour of the card you draw**, and that
      counting the reds gives the number of Tricksters. Never written down
      before; the game does not work without it.
- [ ] Teach from `draft-01` (rebuilt for 2026) rather than `lecture-01`, which
      still has the 2025 term table and Piazza link.

## 🔴 MAKE HW1

**Due Sunday 2026-09-20** (end of week 2). Nothing exists for it yet.

- Needs a PrairieLearn assessment under
  `pl-ubc-dsci220/courseInstances/2026W1/assessments/`
- `homeworks/homework-01_homework.qmd` is a stub that just says "complete it on
  PrairieLearn" — it needs the real link and the problem list
- Same for HW2–HW5: due Sun **Oct 4**, **Nov 8**, **Nov 22**, **Nov 29**

## Canvas

- [x] ~~Create the Canvas homepage, then publish the course.~~ Done — course
      191848 is live, so the sidebar, syllabus and recording links all resolve.

## PrairieLearn

- [x] ~~Publish the 2026W1 course instance.~~ Published 2026-09-09 23:14.
- [x] ~~Re-date Activity 1.~~ Full credit now runs to Sun Sep 13.
- [ ] **Check students can enrol.** `selfEnrollment` was removed from
      `infoCourseInstance.json`, so joining now depends on PrairieLearn's
      default. Worth testing with a student account before Friday — it is how
      they get in during class.
- [ ] Lecture 1's "Before Friday" slide still says the activity "will be posted
      on PrairieLearn" — now stale, since it is live and done in class Friday.
- [ ] Port the 2025W1 tutorials, examlets and practice sets into the 2026W1
      instance — it currently holds only Activity 1.
- [ ] Fill in per-assessment links in `data/additional-resources.csv`; the exam
      rows all point at the course instance rather than individual assessments.

## Website

- [ ] Merge PR #1 (`2026W1-migration`), then move the submodule pointer in
      `dsci220-root` and push the root repo.
- [ ] Tutorials are modelled in the `First` slot, which resolves to Monday. The
      real sections are Tue 2–4, Tue 4–6, Wed 1–3, Wed 3–5.
- [ ] Recording links are placeholders pointing at the Canvas course.

## Next year

- [ ] **Grouping.** Forming groups of exactly six cost time and did not really
      work. Groups of 4-6 all solve, so hand one envelope per block of adjacent
      seats and deal one card per person present. See the lecture-1 lesson plan.

## From the TA meeting, 2026-09-11 (Perrie and Noah; Marko away)

- [ ] **Report the scrolling bug** hit while giving Marko student-data access
      for the term. Note where it happened (PrairieLearn? Canvas?) and what the
      page was doing, while it is fresh.
- [x] ~~Lab section assignments.~~ **L1C is cancelled.** Remaining:

      | Section | Day | Time | Room | TA | Enrolled |
      |---|---|---|---|---|---|
      | L1A | Wed | 1–3 | SPPH 143 | **Marko** | 24/26 |
      | L1D | Tue | 2–4 | ORCH 3002 | **Noah** | 26/26 (full) |
      | L1B | Tue | 4–6 | ORCH 3002 | **Perrie** | 17/26 |

- [ ] **Re-home L1C's 5 students.** L1D is full, L1A has 2 spaces, L1B has 9 —
      so they fit, but 3 of the 5 must take the Tue 4–6 slot.
- [ ] **Marko's section loses Tutorial 3.** Week 4's Wednesday is **Sep 30**,
      the National Day for Truth and Reconciliation. With L1C gone, L1A is the
      only Wednesday section, so Marko's 24 students get 9 tutorials to the
      Tuesday sections' 10. Options: skip Tutorial 3 for everyone, run it async
      for L1A, or hold that week's content back from assessment.
- [ ] **Articulate hours of engagement** — what each TA is expected to spend
      where, against their appointment hours. Settled so far:

      | | |
      |---|---|
      | Lab section | 2 hrs/week × 10 tutorial weeks (9 for Marko — Sep 30) |
      | Office hours | by appointment, all three |
      | Piazza | **primarily Cinda**, not a TA duty |
      | Weekly async video | unassigned — 13 of them, see below |
      | Marking | not yet discussed |
      | Prep / meetings | not yet discussed |
- [ ] **Who helps with the weekly video** — the async Friday recording, needed
      every week from Week 2 (13 of them). Currently nobody is named.

## Lab development

- [ ] See `_labs.md` — process, where materials live, and the per-lab tracker.
      Lab 1 is Cinda's. Six of the ten are new builds; only four exist from
      2025W1.

## Promotion

- [ ] **Advertise the DSCI Instagram** (Jayden's). Need the handle. Candidate
      places: the Canvas front page, a Lecture 1 announcement slide, and/or the
      website sidebar under Resources. Not a course-content link, so probably
      Canvas + a slide mention rather than the schedule.

## Question bank

- [ ] **Write more WFF questions.** WFFs are ~46% of lecture 2 but only 2 of 294
      questions in the bank (`2026W1/logic/WFF1`, `WFF2`), and both test
      recognition — "is this a WFF?" / "which of these are WFFs?" Nothing asks
      for a **generation** -- building a formula by applying the rules -- which
      is the part class spends longest on and the
      same machinery as the context-free grammars in week 10. Decision
      2026-09-10: fix the imbalance by adding questions, not by cutting class
      time. Candidates: apply a named rule to a given line; give the rule
      sequence that produces a target formula; spot the illegal step in a
      generation. (Avoid the word "derivation" in student-facing material: in
      formal language theory it is correct, but in a logic course it collides
      with deriving a conclusion from premises, which arrives with Rules of
      Inference.)
      Note the 46%-vs-2-questions figure understates WFFs' weight: **logical
      equivalence is a relation between well-formed formulas**, so the 76
      equivalence questions in the bank presuppose WFFs rather than competing
      with them. "Is $(p \lor q) \equiv (q \lor p)$?" only means something once
      both sides are known to be legal formulas, and the equivalence laws are
      rewrite rules on formula structure. Time spent on WFFs is not time taken
      from equivalence; it is what makes equivalence statable.

## Open decisions

- [ ] Course part titles and week spans — currently Part 1/2/3 starting weeks
      1, 6, 11, all titled "Topic to be decided".
- [x] ~~TA office hours.~~ By appointment, for all three.
- [ ] Final exam window — in the ORCA, same as the examlets. Date still *TBC*.
- [ ] In-class activities for lectures 2 and 3 — the slots in `draft-02` and
      `draft-03` are marked TBD. Everything must be linked from a slide, since
      activities are not linked anywhere else on the site.
- [ ] `slides/_unassigned/14_wed_graphs.qmd` — Graphs has no slot in the 35.
      Also parked: the three `XX_` Representation-as-Encoding decks and
      `misc_skipped.qmd`.
- [ ] Optional: even out packets 11, 12 and 14 (1, 5 and 1 Tricksters). Card
      swaps that keep every fact true are in the lecture-01 lesson plan.

## Weak spots in the term

- **Week 2** carries HW1 nine days after the first class, and is where the async
  Fridays begin.
- **Weeks 6 and 10** have no tutorial, no homework and no examlet. Week 6 has no
  in-person class at all (Thanksgiving, then two videos); week 10 is one Friday
  video.
