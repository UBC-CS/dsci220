# DSCI 220 — homeworks, 2026W1

Five homeworks, all new this term. Due Sunday 23:59 of weeks 2, 4, 7, 9 and 12 —
the tutorial weeks that do not carry an examlet.

Only **HW1 exists in PrairieLearn**. The rest are lists here until they are
built.

| | Week | Due | In PL? |
|---|---|---|---|
| HW1 | 2 | Sun Sep 20 | yes |
| HW2 | 4 | Sun Oct 4 | no |
| HW3 | 7 | Sun Oct 25 | no |
| HW4 | 9 | Sun Nov 8 | no |
| HW5 | 12 | Sun Nov 29 | no |

Settings that HW1 established, worth copying: `type: Homework`,
`autoPoints: 1` per question, `triesPerVariant` set explicitly (PL defaults it
to **1**, which ends the instance on a single wrong answer), and
`accessControl` with `afterLastDeadline: {allowSubmissions: true, credit: 0}`
so late work can still be practised.

---

## HW1 — due Sun Sep 20 · built

Entirely propositional. No dataframes anywhere, deliberately, so the `-df`
questions in HW2 land as a reveal rather than a repeat — see the three-stage arc
in `_sequence.md`.

| Zone | Question |
|---|---|
| Warm Up | `Basic_Logic--Level02` |
| Functional Completeness | `2025W1/logic/functional-completenessA` · `B` · `C` |
| Well-Formed Formulas | `2026W1/logic/wff-structure` |
| Which conditions matter | `2026W1/logic/which-conditions-matter` |
| When a truth value is missing | `2026W1/logic/missing-truth-values` |

**Open:** functional completeness is taught in no lecture — it is learned here
and only here. Whether it is fair game for EX1 is undecided. If it is, students
get one graded attempt and no practice.

---

## HW2 — due Sun Oct 4 · not built

Everything below is already written; HW2 is an assembly job, not an authoring
one.

**The dataframe callbacks.** These are the payoff for HW1 keeping quiet about
data. All three need Boolean masks, which is lecture 8 on **Fri Sep 25** — nine
days before the due date, so the timing works.

- `2026W1/logic/which-conditions-matter-df` — built
- `2026W1/logic/missing-truth-values-df` — built, two `pl-python` cells
- `2025W1/logic/equivalence-with-nans` — built. This one is about
  **trichotomy**, not De Morgan: `¬(a < 4) ≡ (a ≥ 4)` fails under NaN because
  IEEE 754 makes every NaN comparison False. The 2025 speaker note claiming De
  Morgan breaks is wrong — De Morgan holds in Kleene and in pandas, verified.

**The truth-table proof questions**, moved out of EX1 practice on 2026-09-16
because they ask for "the rows needed in a formal proof". Proofs are lecture 6,
**Mon Sep 21**, so they are in scope by Oct 4. Currently parked in
`practice-ex2`; moving them here means removing them there.

- `2026W1/Week3/Validity/prove_valid_truth_table1`
- `2026W1/Week3/Validity/prove_valid_truth_table3`
- `2026W1/Week3/Validity/prove_invalid_truth_table1`

**Conjunctive goals stall, and splitting fixes them.** Raised 2026-09-23 while
building lecture 7; too slow for class, but it is a good homework exploration
because the student can run the experiment rather than be told the answer.

To prove `premises ⊨ C` you add `¬C` and hunt for a contradiction — an empty clause. When `C` is a single
literal, `¬C` is a *unit*, so propagation always has somewhere to start. When
`C` is `A ∧ B`, De Morgan makes `¬C` the clause `{¬A, ¬B}` — still perfectly
good CNF, but no longer fuel. Measured over 435 randomly generated valid
arguments: a single-literal goal stalled **0.0%** of the time, a conjunctive
goal **1.8%**.

The fix is to ask a different question. `premises ⊨ A ∧ B` exactly when
`premises ⊨ A` and `premises ⊨ B`, so run two refutations, each with a unit
goal. Of the 8 conjunctive cases that stalled, splitting rescued **all 8**.

Worth having students find both halves themselves — build a case that stalls,
then split it — since it previews the case split that ends lecture 7. When
nothing is forced, you make something forced.

**Also available if it needs more weight:** resolution needs a CNF question and
none exists — resolution runs on CNF and nothing in the bank asks for one.

---

## HW3 — due Sun Oct 25 · not built

Nothing assigned yet. Covers roughly weeks 5–7.

---

## HW4 — due Sun Nov 8 · not built

Nothing assigned yet. Covers roughly weeks 8–9.

---

## HW5 — due Sun Nov 29 · not built

Nothing assigned yet. Covers roughly weeks 10–12.

---

## Question style by venue

Decided across the week of 2026-09-14. Homework is where a **guided
walkthrough** belongs — untimed, done alone over days, so a question can build
a concept: do the thing, notice the pattern, then name it. Practice sets are
**drills**, because they rehearse a 50-minute examlet. Tutorial sits in between,
worked with peers and a TA.

A walkthrough that does not fit a practice set belongs in a homework, not
shrunk. Models to copy: `which-conditions-matter`, `wff-structure`,
`2026W1/logic/converse-contrapositive-inverse` (currently in EX1 practice, but
walkthrough-shaped — a candidate to move here).

## Website links

`data/additional-resources.csv` carries a `homework` row per assignment.
`homework-01` has its PrairieLearn URL; `homework-02` through `05` are `TBD`
and will show no link until filled.
