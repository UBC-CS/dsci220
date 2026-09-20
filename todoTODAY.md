# Today — Sat 19 Sep 2026

Week 3 runs **Mon 21 – Sun 27 Sep**. It is EX1 week. Ordered by stake, not by date.

Backlog in `_todo.md`. Sequence decisions in `_sequence.md` (that one is the
record — this file gets rewritten). Labs in `_labs.md`. Email in `weeklyemail.md`.
Homework plans in `_homeworks.md`.

---

## 1 — EX1 does not exist · opens **Thu Sep 24** · 10% (1 of 5)

Five days. The only hard deadline on this list.

- [ ] **Build it.** Still nothing in `courseInstances/2026W1/assessments/` —
      no examlets at all, nor the final. Port from 2025W1 `ex1week3`, but that
      was a different sequence: last year's EX1 had **no inference at all**,
      and this year's covers lectures 1–5, propositional logic entire, ending
      with the rules of inference. `practice-ex1`, now 39 questions and reviewed
      end to end, is the model for what is in scope.
- [ ] **Rule on functional completeness.** Taught in no lecture — HW1 and only
      HW1. If it is fair game for EX1, students had one graded attempt and no
      practice. This decides EX1's content, so it comes first.
- [ ] **PrairieTest sitting.** The enrolment link is live and on lectures 4
      and 5, and the website's Book button points at the course. Unknown whether
      the sitting itself exists for students to book into.
- [ ] Settings: `type: Exam`, with a points list for diminishing credit. That
      is the exam idiom — unlike Homework, where `triesPerVariant` does the work
      and defaults to a single try.

## 2 — Sunday, once HW1 closes 23:59

- [ ] **Add `wff-structure` to `practice-ex1`.** Held back because it is a
      graded HW1 question; free once HW1 closes. Parse trees are the last
      coverage gap that is not deliberate, and this still leaves four days
      before EX1.
- [ ] **Send the week 3 letter.** Draft in `weeklyemail.md` — facts only, needs
      your voice. It has to announce the **office hours move to Tue
      10:30–11:30**, since week 2's letter and two weeks of class all said
      Monday.

## 3 — Week 3 teaching

- [ ] **Lecture 6, Mon Sep 21 — resolution.** 74 minutes of material for a
      50-minute class, so it runs into lecture 7, and the activity was never set
      up well. Parked for "next weekend", which is now.
- [ ] **Lecture 8, Fri Sep 25 — predicates, Boolean masks, quantifiers.** 57
      min. Boolean masks is the reveal that HW1's reduction was a dataframe
      filter all along, and HW2 depends on it.
- [ ] **Record Wednesday 12–1**, as established.

## 4 — People

- [ ] **Book the weekly staff meeting.** **Mon 12–1 is free again** — office
      hours moved to Tue 10:30–11:30 on 2026-09-18. Mon 12–1 or Mon 1–2 both
      work; both sit after Monday's class and before Noah's Tue 2pm lab. Nobody
      asked yet.
- [ ] **Re-home L1C's 5 students.** L1D full, L1A has 2 spaces, L1B has 9 — so
      3 of the 5 must take Tue 4–6.
- [ ] **Assign lab owners.** Only Lab 1 has one.
- [ ] **Who helps with the videos.** 12 left.
- [ ] Tell the TAs what they are running each week.
- [ ] Report the scrolling bug from giving Marko student-data access.

## 5 — Small and stale

- [ ] **Course part titles.** The live site still says "Topic to be decided" in
      16 places — the most visible unfinished thing on it.
- [ ] **Dead `course_instance/186238`** in `lecture-16_slides.qmd`. Lecture 4's
      copy is fixed.
- [ ] Final exam date, from the Registrar. DSCI Instagram handle (Jayden's).

## 6 — Parked, with reasons

- [ ] **A CNF question.** Resolution runs on CNF and nothing in the bank asks
      for one. Would suit HW2 if it needs weight.
- [ ] **Predicate inference deck.** Does not exist, and no questions either.
      Needed for lecture 9, Mon Sep 28.
- [ ] **HW2**, due Sun Oct 4. Assembly, not authoring — every question already
      exists. See `_homeworks.md`.
- [ ] **A real parse-tree question** for practice and the examlet. Design
      agreed: build the tree offline, then ask questions only answerable with
      it — relationships, not root or depth, which can be shortcut by counting.
- [ ] **Easier equivalence proofs.** An Easy band exists in `equiv_proofs.py`
      and nothing uses it.
- [ ] `converse-contrapositive-inverse` is drill-shaped now; the walkthrough it
      replaced may belong in a homework.

---

## Cleared since Sep 13

Lectures 3, 4 and 5 built and delivered; lecture 5 recorded Wednesday and its
rule names aligned to the Formula Sheet. HW1 and Tutorial 1 opened.
`practice-ex1` reviewed end to end, cut 72 → 39, with two new questions written
(`valid-or-fallacy`, `converse-contrapositive-inverse`) closing the fallacy and
converse gaps, and `triesPerVariant` set so a wrong answer no longer ends the
instance. Website: Friday's deck now reveals with Wednesday's, the examlet Book
and Practice buttons work, booking windows show as ranges, week 2 recordings and
the tutorial link are in, office hours moved. `_homeworks.md` started.
Lecture 4's dead course-instance link and its "class THIS Friday" line are gone,
and the `homeworks/` stubs were deleted.
