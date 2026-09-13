# DSCI 220 — lecture sequence, 2026W1

Decided 2026-09-12. **This file is the record. `todoTODAY.md` gets rewritten;
this does not.**

The 2025W1 offering was the first time this course was taught, and its lecture
order was a rough draft. Nothing in it should be treated as considered design —
consecutive decks overlap heavily (04/05, 05/06, 08/09, 17/18, 21/22, 24/25/26,
33/34) because material was carried forward and the source deck was never
trimmed.

## The principle

**All propositional material finishes before predicates begin.**

The order is forced by dependency, not preference:

```
implication ──► propositional inference ──► resolution ──┐
                                                         ├──► predicate inference ──► proofs
predicates ──► quantifiers ───────────────────────────────┘
```

Two independent chains that merge. Implication must precede propositional
inference, because modus ponens is a statement about →. Predicates must precede
quantifiers, because ∀x P(x) needs P(x). Both must precede predicate inference,
which is the lifting of the propositional rules onto quantified statements.

**Predicate inference is the proof template.** "Take arbitrary *x*, assume
*P(x)*, derive *Q(x)*, conclude ∀x(P(x)→Q(x))" is universal instantiation, then
propositional inference, then universal generalization. Lecture 9 opens with
"What is a proof?" and the answer is a thing the course never names.

## The sequence

| | Date | | Content |
|---|---|---|---|
| L4 | Wed Sep 16 | class | Implication · LE Proof · Vocabulary · Converses · Biconditionals · **Validity** |
| L5 | Fri Sep 18 | video | **Propositional inference** — the 8 rule cards, fallacies |
| | | | ⟵ EX1 window closes. **EX1 = propositional logic, entire** |
| L6–L7 | Sep 21, 23 | class | **Resolution** — 74 min of material, so two slots |
| L8 | Fri Sep 25 | video | **Predicates + quantifiers** |
| L9 | Mon Sep 28 | class | **Predicate inference** — deck does not exist |
| | Wed Sep 30 | — | Truth and Reconciliation, no class |
| L10 | Fri Oct 2 | video | Proofs begin ⟵ EX2 window closes |

**Lectures past 5 are draft.** L4 and L5 are committed; everything after is a
holding arrangement.

### Why L4 ends on Validity

An argument is valid exactly when premises → conclusion is a tautology. That is
the hinge from implication into the rule cards, and it lands on the tautology /
contradiction concept from lecture 3. It belongs at the end of the propositional
block, not buried mid-inference where it was.

### The video is the overflow buffer

Decided 2026-09-12. Lecture 4 carries ~68 min of material into a 50-minute
class, deliberately. **Whatever is not covered Wednesday moves into Friday's
video.** It is the only lecture whose length is set rather than discovered, so
it is the only place a backlog can be paid down instead of cascading.

Consequence: L5 is 41 min of rule cards plus up to ~18 of overflow, so it sits
at the one-hour cap with no slack. And the recording must happen **after**
Wednesday's class — either Wed 12–1 (the only free hour; releases Wed night
with PE1, matching the announcements slide) or Thu 10–11 (what `_labs.md` says,
but then the slide's "video released by Thursday morning" is wrong).

### Why the rule cards are the video

Eight named rules, each one pattern, already authored as flashcards — the most
expositional material in the course. The three activities that follow them
(Spot the Rule, Build a proof, Design a Trap) need people in a room, so they
anchor the Monday after.

## Deferred

- **Nested Quantifiers** and the Hero/Villain worksheet. Proofs with single
  quantifiers come first; multiples are not on the critical path. The worksheet
  is pages 3–4 of `data/quantifiers.pdf` (recoverable from git; deleted in
  `6ca88a54`).
- **Boolean Masks / dataframe filtering.** A long way out.
- Both are stashed in `slides/_unassigned/_stash_predicates-quantifiers.qmd`.

### A three-stage arc: reduction, then data, then nulls

Decided 2026-09-12. HW1 (week 2) does data reduction **in pure propositional
logic, with no mention of dataframes**, so that the data connection is still
available later as a reveal rather than already spent.

**Stage 1 — HW1, now.** `2026W1/logic/which-conditions-matter`. Students find
that $P \wedge (P \vee Q)$ ignores $Q$, name absorption, then reduce
$(A \vee B) \wedge (A \vee \neg B) \wedge (A \vee C) \wedge (A \vee \neg C)$
to $A$ by naming four laws. Closes on: a 20-variable truth table needs 1,048,576
rows, so use the laws. Nothing about data.

**Stage 2 — lecture 8, Boolean masks.** Reveal that the formula was a filter.
Four conditions per row collapse to one; write both in pandas and run them.
They predicted this in week 2 from the laws alone.

**Stage 3 — after lecture 8 (HW2 or later): three-valued logic.** Cinda's
`references/prairielearn_3vl_logic_prompt.txt` is the seed. Verified content,
worth keeping:

- In Kleene 3VL (T, F, U) **De Morgan holds** — both directions — as do double
  negation, commutativity and distributivity. Exactly two classical laws fail:
  **excluded middle** ($p \vee \neg p \equiv \mathsf{T}$) and
  **non-contradiction** ($p \wedge \neg p \equiv \mathsf{F}$). Both give U when
  $p$ is U.
- **Only one of those failures can change a query**, because a filter keeps T and
  nothing else. Excluded middle failing turns an expected T into U — a kept row
  is dropped. Non-contradiction failing turns an expected F into U — a dropped
  row stays dropped.
- Therefore **the two classically-identical formulas behave differently**:

  | | Classically | Under nulls |
  |---|---|---|
  | $(A \vee B) \wedge (A \vee \neg B) \wedge \ldots$ — HW1's | $\equiv A$ | same rows, **safe** |
  | $(A \wedge B) \vee (A \wedge \neg B) \vee \ldots$ | $\equiv A$ | differs at $A{=}\mathsf{T}, B{=}\mathsf{U}, C{=}\mathsf{U}$, **unsafe** |

  HW1's version reduces via non-contradiction; the other via excluded middle.
  That is the whole difference, and swapping $\wedge$ and $\vee$ causes it.
- The sharpest demonstration: `mask = df['age'] > 21`. A row with a missing age
  makes the mask U, so $P \vee \neg P$ is U, and that row appears in **neither**
  `df[mask]` nor `df[~mask]`. Splitting a dataframe in two loses rows.
- **Do not claim De Morgan breaks.** It holds in Kleene and it holds in pandas
  — verified against 2.3.3 with both numpy `NaN` and nullable `pd.NA`. The
  2025 Boolean Masks speaker note says otherwise and is wrong.
- The dtype split is its own lesson: numpy float comparisons against `NaN`
  return **False**, so a missing value is silently treated as "condition not
  met" and the row is *included* by a negated filter. Nullable dtypes
  (`Float64`, `Int64`, `boolean`) return NA and the row is *excluded* by both.
  Same expression, same data, different rows — decided by dtype alone.
- The prompt's `topic: "Logic"` is not a declared topic — use `module-1`.

### Parked, not dropped: the NaN question

`2025W1/logic/equivalence-with-nans` came out of Tutorial 1 on 2026-09-12
because Boolean masks are now lecture 8. **It is not retired — target HW2.**

**Checked 2026-09-12: the question is sound and needs no rewrite.** It is not
about De Morgan — the *slide note* was, and that note was wrong. This question
compares `protein >= 4` with `~(protein < 4)`. Under IEEE 754 every comparison
with `NaN` is False, so both are False at once, and the first filter excludes
that row while the second includes it. The law that breaks is **trichotomy** —
exactly one of <, =, > holds — which is what licenses ¬(a < 4) ≡ (a ≥ 4).

It uses a PrairieLearn workspace, which is more machinery than the other
questions in this bank; budget for that.

It is also the natural predecessor to the 3VL question rather than a duplicate:
here `NaN` **collapses to False** (numpy), there it **stays unknown** (nullable
dtypes). Same missing value, two semantics, chosen by dtype alone.

Timing works: Boolean Masks is Fri Sep 25 (lecture 8), HW2 is due Sun Oct 4.

## Known consequences

- **EX2 is lopsided.** Its window covers resolution through the start of proofs
  — five lectures, the hardest stretch — while EX1 is one clean topic.
- **Proofs start in a video** unless resolution is trimmed to one slot.
- **PE1 → 41 questions**, propositional only. The 19 predicate/Boolean-mask
  questions move to PE2.
- **Tutorial 1 loses `equivalence-with-nans`** — dataframe filtering is now weeks
  away. That leaves 6 questions; if functional completeness also moves to HW1 it
  leaves 3, so new logical-equivalence questions are required, not optional.
- **Functional completeness is taught in no lecture, all term.**
- **Lecture 27 / CFGs has no questions anywhere** in the 446-question bank.

## Still to do

- Resolution needs care — the activity was not set up well last year.
  *Scheduled for the weekend of Sep 19–20, not this one.*
- Build the predicate inference deck. No questions for it exist either.
- Place the stashed predicate/quantifier material into L8.
