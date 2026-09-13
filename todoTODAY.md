# Today — Sat 12 Sep 2026

Week 2 runs **Mon 14 – Sun 20 Sep**. Ordered by **stake**, not by date — the
nearest deadline is also the cheapest thing on the list.

Backlog in `_todo.md`. Lab tracker in `_labs.md`. Weekly email in `weeklyemail.md`.

---

## 1 — EX1 does not exist  · written Thu–Sun of week 3, **Sep 24–27** · 50%

Nothing for it in `courseInstances/2026W1/assessments/`. No examlets at all
exist for 2026W1, nor the final.

- [ ] Port from 2025W1 `ex1week3`. Those questions are last year's, so they are
      already vetted.
- [ ] Covers weeks 1–2, i.e. through Friday 18 Sep — including that day's async
      video. Quantifiers are on it.
- [ ] Needs a PrairieTest sitting. The 2026W1 enrolment link is still unknown;
      lectures 4 and 5 carry the dead 2025 one.

## 2 — Lab 1 cannot be opened · **Tue Sep 15, 2pm** · 10%

- [ ] **`accessControl` is `[]`.** Students cannot open it. One JSON block,
      copied from `class3-equivalence`. Blocked only on you naming the window.
- [ ] Decide the staff question you have out: move Functional Completeness and
      Tautologies/Contradictions to HW1, replace with more LE practice?
      - Functional completeness **is taught in no lecture all term** — moving it
        to HW1 relocates that problem rather than fixing it.
      - Tautology/contradiction **is** taught, Monday, before every section's
        tutorial. It is the best-aligned group in the set.
      - The NaN question now lands *before* its lecture for the Tuesday
        sections — Boolean Masks moved to lecture 4, Wed 11am.
- [ ] Put Lab 1's URL in `data/additional-resources.csv`; the
      `tutorial-01,activity` row still says `TBD`, so the schedule column is grey.
- [ ] Tell the TAs where Lab 1 is and what they are running.

## 3 — HW1 does not exist · due **Sun Sep 20** · 10%

Monday's announcements slide says "HW1 available".

- [ ] Build the assessment. The `Homework` set now exists, so nothing blocks it.
- [ ] Fill in `homeworks/homework-01_homework.qmd` — still a stub reading
      "complete it on PrairieLearn".

## 4 — PE1 · releases **Wed Sep 16, 23:59** · ungraded

Lowest stake on the list; let this one slip if something must.

- [ ] 60 questions. 10 vetted from last year, **50 new, 40 of them Marko's**.
- [ ] Draft assessment is sitting untracked at
      `courseInstances/2026W1/assessments/practice-ex1/` — not committed, not
      pushed, never synced. PrairieLearn has not seen it.
- [ ] Choose: release all 60; release the 20 vetted now and add the rest after
      review; or push the date.

---

## Also this week

- [ ] **Record the async video** (`lecture-05`, Fri 18 Sep) — first of 13, nobody
      named to help. Slot is **Thu 10–11**, but Monday's slide promises the video
      "by Thursday morning". One of those has to move; **Wed 12–1** is the only
      other hour free for all four.
- [ ] **Lecture 4** (Wed 16 Sep) — has lecture 3's tail at the front. Open
      questions: does ∀ appear Wednesday or wait for Friday, and does the cereal
      block survive.
- [ ] **Lecture 4's announcements are wrong**, not just stale: "class THIS
      friday" (there isn't one) and "tutorials begin next week" (they begin the
      day before).
- [ ] Tell students **the Friday videos are examinable.** Nothing says so, and
      the first one is in six days.

## People

- [ ] **Book the weekly staff meeting.** Proposed Mon 12–1. Nobody asked yet.
- [ ] **Re-home L1C's 5 students.** L1D full, L1A has 2 spaces, L1B has 9 — so 3
      of the 5 must take Tue 4–6. You dropped the cancellation line from the
      Monday slide.
- [ ] **Assign lab owners.** Only Lab 1 has one.
- [ ] **Report the scrolling bug** from giving Marko student-data access.

## Decide when convenient

- [ ] **Sep 30 / Tutorial 3.** Truth and Reconciliation is week 4's Wednesday.
      L1A is the only Wednesday section, so Marko's 24 get 9 tutorials to
      everyone else's 10.
- [ ] Course part titles — live site still says "Topic to be decided".
- [ ] Final exam date. DSCI Instagram handle (Jayden's).

---

## Lecture sequence decided 2026-09-12

All propositional material finishes before predicates begin. Order is forced by
dependency: implication → propositional inference → resolution, and separately
predicates → quantifiers; the two chains merge at predicate inference, which is
the proof template and is currently **taught nowhere** (three bullets in
lecture 7, a bare heading in lecture 9, no questions in the bank).

| | Date | | Content |
|---|---|---|---|
| L4 | Wed Sep 16 | class | Implication · LE Proof · Vocabulary · Converses · Biconditionals · Validity |
| L5 | Fri Sep 18 | video | Propositional inference — the 8 rule cards, fallacies |
| | | | ⟵ EX1 window closes. **EX1 = propositional logic, entire** |
| L6–L7 | Sep 21, 23 | class | Resolution (74 min = two slots) |
| L8 | Fri Sep 25 | video | Predicates + quantifiers |
| L9 | Mon Sep 28 | class | Predicate inference — **deck does not exist** |
| | Wed Sep 30 | — | Truth and Reconciliation, no class |
| L10 | Fri Oct 2 | video | Proofs begin ⟵ EX2 window closes |

**This weekend**: L4 and L5 only. L5 is the rule cards lifted out of lecture 7,
and it has to exist before Thursday's recording.

**Next weekend**: resolution — the activity was not set up well last year and
needs care — plus placing predicates/quantifiers and building predicate
inference.

Deferred indefinitely: Nested Quantifiers and the Hero/Villain worksheet (proofs
with single quantifiers come first); dataframe filtering / Boolean Masks.

Consequences already known:
- EX2 is lopsided — its window covers resolution through the start of proofs,
  five lectures, while EX1 is one topic.
- Proofs start in a video unless resolution is trimmed to one slot.
- PE1 → 41 questions, propositional only; the 19 predicate ones move to PE2.
- Tutorial 1 loses `equivalence-with-nans` — dataframe filtering is now weeks
  away. That leaves 6 questions, and if functional completeness also moves to
  HW1 it leaves 3, so new LE questions are required, not optional.

## Standing rules agreed 2026-09-12

1. Practice releases **Wednesday 23:59 of week *N*−1** for an examlet in week
   *N*, alongside that week's video. Dates computed for all five.
2. **Review is gated by release**, never done in bulk. Load per set:
   PE1 50 new, PE2 68, PE3 37, PE4 11, PE5 0. PE2 is the pressure point —
   all 68 are Marko's and none are vetted.
3. **No Marko-authored question enters a graded assessment unreviewed.**
   Currently zero crossings: every graded question in 2026W1 is yours or Joe's.
4. Marko's nine `practice/week_*` sets stay as his working material, no access
   rules. The five `practice-ex*` sets are what students see.

Parked as far-away: week 7 has no practice set (inside EX3's window, Oct 21),
and lecture 27 / CFGs has no questions anywhere in the bank.
