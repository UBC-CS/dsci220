# DSCI 220 — Discrete Math for Data Science

Course website for [DSCI 220](https://ubc-cs.github.io/dsci220) at UBC,
built with [Quarto](https://quarto.org/) on Stephan Koenig's
[`course-template`](https://github.com/stephan-koenig/course-template).
Deployed to GitHub Pages by the `deploy-website` GitHub Action.

- Live site: <https://ubc-cs.github.io/dsci220>
- 2025W1 archive: <https://ubc-cs.github.io/dsci220-2025W1>

The landing page schedule is generated from `data/schedule.csv` and
`data/additional-resources.csv` by the R renderers in `R/`. Course materials
live in `slides/`, `activities/`, `homeworks/`, and `summaries/`, named
`<id>_<type>.qmd` (e.g. `lecture-06_slides.qmd`).

Different audience versions render to sub-directories via Quarto profiles:
`student` → `/`, `access,student` → `/access`, `instructor` → `/instructor`,
`ta` → `/ta`.
