source(here::here("R", "fct-to-lower.R"))
source(here::here("R", "fct-to-snake.R"))
source(here::here("R", "format-exam-with-due-date.R"))
source(here::here("R", "format-resource-as-label.R"))
source(here::here("R", "format-week-with-start-day.R"))
source(here::here("R", "get-schedule.R"))
source(here::here("R", "highlight-current-week.R"))

# DSCI 220 meets Mon + Wed in person and releases an async video on Fri (from
# Week 2). Weekly tutorials replace the template's discussion. The template's
# weekly renderer hard-coded Tue/Thu lectures and a single discussion, so the
# day keys, spanners and spacer anchors below are adapted for Mon/Wed/Fri and a
# "Tutorial" column, and the examlet + homework columns feed off `exam` /
# `homework` units instead of `exam` / `potw`.

# Columns that must exist for the gt spacer anchors and spanners to resolve even
# when no row in the schedule produced them (e.g. no Monday has a recording).
lecture_col_order <- c(
  "mon_lecture_slides", "mon_lecture_activity", "mon_lecture_recording",
  "wed_lecture_slides", "wed_lecture_activity", "wed_lecture_recording",
  "fri_lecture_slides", "fri_lecture_activity", "fri_lecture_recording"
)
tutorial_col_order <- c("first_tutorial_lesson_plan", "first_tutorial_activity")

ensure_character_columns <- function(data, columns) {
  missing <- setdiff(columns, names(data))
  data[missing] <- NA_character_
  data
}

render_weekly_schedule <- function() {
  schedule <- get_schedule() |>
    dplyr::filter_out(is.na(type)) |>
    dplyr::mutate(
      date = gt::vec_fmt_date(date, date_style = "MMMd"),
      label = purrr::pmap_chr(
        list(show_week, id, type, resource),
        format_resource_as_label
      ),
      label = dplyr::replace_when(
        label,
        unit == "week" ~ format_week_with_start_day(date, id, resource),
        unit == "exam" ~ format_exam_with_due_date(
          slot,
          date,
          show_week,
          show_exam,
          id,
          resource
        )
      )
    )

  parts_and_weeks <- schedule |>
    dplyr::filter(unit %in% c("part", "week")) |>
    dplyr::select(
      week_number = week,
      current_week,
      show_week,
      show_exam,
      unit,
      label
    ) |>
    # Combine if there is more than one part per week
    dplyr::summarize(
      label = stringr::str_flatten(label, "<div>&nbsp;</div>"),
      .by = c(week_number, current_week, show_week, show_exam, unit)
    ) |>
    tidyr::pivot_wider(
      names_from = unit,
      values_from = label
    ) |>
    tidyr::fill(part)

  lectures_and_tutorials <- schedule |>
    dplyr::filter(unit %in% c("lecture", "tutorial")) |>
    # Ensure the column order after pivoting follows day order
    dplyr::arrange(slot) |>
    dplyr::select(
      week_number = week,
      slot,
      unit,
      type,
      label
    ) |>
    dplyr::mutate(
      slot = fct_to_lower(slot),
      type = fct_to_snake(type)
    ) |>
    tidyr::pivot_wider(
      names_from = c(slot, unit, type),
      names_sep = "_",
      values_from = label
    ) |>
    ensure_character_columns(c(lecture_col_order, "first_tutorial_activity")) |>
    dplyr::relocate(
      dplyr::any_of(c(lecture_col_order, tutorial_col_order)),
      .after = week_number
    ) |>
    dplyr::arrange(week_number)

  # Units with only a single resource
  other_units <- schedule |>
    dplyr::filter(unit %in% c("homework", "exam")) |>
    dplyr::select(week_number = week, unit, label) |>
    tidyr::pivot_wider(
      names_from = unit,
      values_from = label
    )

  weekly_schedule <- parts_and_weeks |>
    dplyr::left_join(
      lectures_and_tutorials,
      by = dplyr::join_by(week_number),
      relationship = "one-to-one"
    ) |>
    dplyr::full_join(
      other_units,
      by = dplyr::join_by(week_number),
      relationship = "one-to-one"
    ) |>
    dplyr::mutate(
      week = highlight_current_week(current_week, week)
    ) |>
    dplyr::select(!c(week_number, current_week, show_week, show_exam)) |>
    dplyr::relocate(week)

  spacer <- '<span class="spacer"></span>'
  half_spacer <- '<span class="half-spacer"></span>'

  weekly_schedule |>
    gt::gt(
      groupname_col = "part",
      process_md = TRUE
    ) |>
    gt::sub_missing(missing_text = "") |>
    gt::cols_add(
      after_week_spacer = spacer,
      .after = "week"
    ) |>
    gt::cols_add(
      mon_wed_lecture_spacer = half_spacer,
      .after = "mon_lecture_recording"
    ) |>
    gt::cols_add(
      wed_fri_lecture_spacer = half_spacer,
      .after = "wed_lecture_recording"
    ) |>
    gt::cols_add(
      between_spanners_spacer = half_spacer,
      .after = "fri_lecture_recording"
    ) |>
    gt::cols_add(
      tutorial_half_spacer = half_spacer,
      .after = "first_tutorial_activity"
    ) |>
    gt::cols_add(
      before_homework_spacer = half_spacer,
      .before = "homework"
    ) |>
    gt::cols_add(
      after_homework_spacer = half_spacer,
      .after = "homework"
    ) |>
    gt::cols_label(tidyselect::everything() ~ "") |>
    gt::tab_spanner(
      label = "Mon",
      columns = tidyselect::starts_with("mon_lecture"),
      id = "mon_lecture"
    ) |>
    gt::tab_spanner(
      label = "Wed",
      columns = tidyselect::starts_with("wed_lecture"),
      id = "wed_lecture"
    ) |>
    gt::tab_spanner(
      label = "Fri",
      columns = tidyselect::starts_with("fri_lecture"),
      id = "fri_lecture"
    ) |>
    gt::tab_spanner(
      label = "Classes",
      columns = tidyselect::contains("lecture"),
      spanners = c("mon_lecture", "wed_lecture", "fri_lecture")
    ) |>
    gt::tab_spanner(
      label = gt::md("Tutorial"),
      columns = tidyselect::starts_with("first_tutorial"),
      id = "first_tutorial"
    ) |>
    gt::tab_style(
      style = gt::cell_text(size = "small"),
      locations = gt::cells_column_spanners()
    ) |>
    gt::cols_align(
      align = "left",
      columns = c(exam)
    ) |>
    gt::cols_align(
      align = "right",
      columns = c(week)
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(weight = "bold")
      ),
      locations = list(
        gt::cells_column_labels(),
        gt::cells_column_spanners()
      )
    ) |>
    gt::fmt_markdown() |>
    gt::tab_options(
      quarto.disable_processing = TRUE,
      table.width = "100%"
    )
}
