# Lab development

Not published (Quarto ignores `_`-prefixed files).

## Process

- The **TA team reviews and refines all lab materials** together.
- **One TA owns each lab** — responsible for signing off that it is complete,
  and for keeping it on track.
- The **three TAs meet weekly**. ~~Monday 12:00–1:00~~ — **taken by office
  hours as of 2026-09-13.** Next best is **Monday 1:00–2:00**: still after
  Monday's class and before the week's first lab (Noah's Tue 2pm), so a lab can
  still be fixed after sign-off. Thursday is also open for all four, but falls
  after every lab that week.
- **Video recording: Wednesday 12:00-1:00** (settled 2026-09-15), straight
  after class. It has to be
  after Wednesday's class, since the video absorbs whatever lecture 4 did not
  reach, and the week-2 letter promises students the video **by Thursday
  morning** — so Wednesday night is the only slot that satisfies both.
  Wednesday daytime is full: class 11–12, Marko's lab 1–3, Cinda's other class
  3–4, her other recording 4:30–5:30.
  Cinda has told students she will invite them to attend the recordings once
  things settle, so the slot needs to be one others can join.
- **Lab 1 is Cinda's**, since it lands immediately.

### Cinda's fixed weekly commitments

| Day | |
|---|---|
| Mon | 11–12 class, 12–1 office hours |
| Wed | 11–12 class, 3–4 other class, 4:30–5:30 recording for another course |
| Thu | clear |
| Fri | 11–12 class (async from week 2) |

## Where materials go

| What | Where | Why |
|---|---|---|
| Graded questions | `pl-ubc-dsci220/courseInstances/2026W1/assessments/tutorialNN/` | Tutorials are 10% of the grade, so they need auto-grading and a gradebook |
| Question sources | `pl-ubc-dsci220/questions/2026W1/tutorials/` | Reusable across terms |
| Instructions | Inside the PrairieLearn assessment | Everything students need is in one place |

There are no handout `.qmd` files — the schedule's Tutorial column links
straight to the PrairieLearn assessment (`data/additional-resources.csv`, rows
`tutorial-NN,activity,<PL url>`; they read `TBD` until the assessment exists).
Both repos are git, so review happens through normal commits and pull requests.

## Sections

| Section | Day | Time | Room | TA |
|---|---|---|---|---|
| L1A | Wed | 1–3 | SPPH 143 | Marko |
| L1D | Tue | 2–4 | ORCH 3002 | Noah |
| L1B | Tue | 4–6 | ORCH 3002 | Perrie |

L1C is cancelled.

## Tracker

| Lab | Week | Tue / Wed | Owner | Draft | Signed off | Notes |
|--:|--:|---|---|---|---|---|
| 1 | 2 | Sep 15 / Sep 16 | **Cinda** |  |  |  |
| 2 | 3 | Sep 22 / Sep 23 |  |  |  |  |
| 3 | 4 | Sep 29 / Sep 30 |  |  |  | Wed section cancelled (Sep 30) |
| 4 | 5 | Oct 6 / Oct 7 |  |  |  |  |
| 5 | 7 | Oct 20 / Oct 21 |  |  |  |  |
| 6 | 8 | Oct 27 / Oct 28 |  |  |  |  |
| 7 | 9 | Nov 3 / Nov 4 |  |  |  |  |
| 8 | 11 | Nov 17 / Nov 18 |  |  |  |  |
| 9 | 12 | Nov 24 / Nov 25 |  |  |  |  |
| 10 | 13 | Dec 1 / Dec 2 |  |  |  |  |

Only four tutorials exist from 2025W1 (`tutorial1-logic`, `tutorial2-proofs`,
`tutorial4-numbers`, `tutorial8-nfas`) — so six are new builds, not ports.
