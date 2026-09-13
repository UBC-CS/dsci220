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
