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
`autoPoints: 1` per question, **`triesPerVariant: 1`**, and `accessControl` with
`afterLastDeadline: {allowSubmissions: true, credit: 0}` so late work can still
be practised.

**Homework always runs one try per variant.** Stated 2026-09-26. A student who
gets it wrong takes a *fresh variant*, not another guess at the same one, so the
question cannot be brute-forced. Practice sets are the opposite — `practice-ex1`
and `practice-ex2` both give 10 — because their job is drilling.

For a `singleVariant` walkthrough that means one submission, which is what HW1's
three walkthroughs did. Partial credit still applies across the elements inside
it, so a single slip costs its share rather than the question. HW2 was found set
to 10 on 2026-09-26 and corrected.

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

## HW2 — due Sun Oct 4 · built

Released Sun Sep 27. Everything is answerable on release day — lectures 1 to 8 —
so nothing waits on Monday's or Friday's class, and all of it is examinable on
EX2.

| Zone | Question |
|---|---|
| Which conditions matter, in data | `2026W1/logic/which-conditions-matter-df` |
| When a truth value is missing, in data | `2026W1/logic/missing-truth-values-df` |
| When the law itself breaks | `2025W1/logic/equivalence-with-nans` |
| Does every expression have a CNF? | `2026W1/logic/cnf-always` |
| When propagation runs out of fuel | `2026W1/logic/stalling-goals` |

`cnf-always` proves that every expression has a CNF by checking the smallest
case and checking that each way of building a bigger one preserves the
property — **structural induction, done before it is named**, and tied back
explicitly to HW1's WFF invariant. Both questions now point at the same
technique, so induction proper has two things to call back to.

`stalling-goals` is the conjunctive-goal experiment: three premises, none a
unit, that entail `A ∧ B`. The conjunctive goal stalls with nothing derived;
each half closes in two steps.

**No quantifiers here, deliberately** (decided 2026-09-26). L8 introduced them
and L9 is nested quantifiers on Sep 28 — there is nothing deep to ask yet, and
the drilling belongs in `practice-ex2`. **Quantifier depth is HW3's job.**

---

## HW3 — due Sun Oct 25 · not built

Covers roughly weeks 5–7.

**Quantifier depth lands here.** HW2 skipped quantifiers because L8 had only
introduced them. By HW3 they will have had nested quantifiers (L9), predicate
inference and proofs, so this is where a deep quantifier question belongs.

It will have to be **written**. Marko's 17 questions in
`2026W1/Week2/Predicates/` are drills — one judgement each — so they go to
`practice-ex2`, not here. See [[practice-sets-are-drills]]: the venue decides
the shape.

The one idea worth building into a walkthrough is **page 4 of the L9
worksheet**: a quantifier meaning "there exists exactly 2", asking for the
minimum and maximum marks that make a statement true. Nothing in the course
does counting quantifiers, it forces reasoning about the shape of a satisfying
grid rather than recall of a rule, and it extends naturally — exactly one, at
most two, at least three.

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
