source(here::here("R", "convert-to-date.R"))
source(here::here("R", "check-if-student-profile.R"))
source(here::here("R", "get-id-from-resource.R"))

get_schedule <- function() {
  rendering_student_profile <- check_if_student_profile()
  # GitHub runners are UTC, which would make "Monday" start at 5pm Pacific
  # on Sunday. Reveal on local dates instead.
  current_date <- lubridate::today(tzone = "America/Vancouver")

  lookup <- readr::read_csv(here::here("data", "lookup.csv"), col_types = "cc")
  # Sequence of `type`s in `lookup` table determines column sequence
  # when using `pivot_wider()`
  sorted_types <- lookup$type

  slots <- c(
    "Week",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
    "First",
    "Second",
    "Third"
  )

  monday_of_first_term_week <- yaml::read_yaml(
    "_variables.yml"
  )$course$`monday-of-first-term-week`

  # Generate ids for each link to join into schedule.
  # Skip resource directories that do not exist yet (e.g. no lesson plans have
  # been written), since git does not track empty directories.
  resources_paths <- lookup$directory |> na.omit()
  resources_paths <- resources_paths[fs::dir_exists(resources_paths)]

  # Decks Cinda wants up before the usual rule would show them -- a holiday
  # moves a recording, say. This can only bring a reveal FORWARD; anything not
  # listed keeps the automatic date. One row per id, with a reason.
  reveal_early <- readr::read_csv(
    here::here("data", "reveal-early.csv"),
    col_types = "cDc"
  ) |>
    dplyr::select(id, early_reveal = reveal)

  schedule <- readr::read_csv(
    here::here("data", "schedule.csv"),
    col_types = "icc"
  ) |>
    dplyr::mutate(
      slot = forcats::fct(slot, levels = slots),
      # Sequence of `id`s in `schedule.csv` determines column sequence
      # when using `pivot_wider()`
      unit = id |> stringr::str_extract("^[^-]+") |> forcats::fct(),
    )

  # Auxiliary material -- a second deck or video for a lecture slot -- is named
  # `<id>_aux`: `lecture-13_aux_slides.qmd`, or `lecture-13_aux` as the id in
  # additional-resources.csv. It joins to its lecture's row and shows as a
  # second icon in the same cell.
  additional_resources <- readr::read_csv(
    here::here("data", "additional-resources.csv"),
    col_types = "ccc"
  ) |>
    dplyr::mutate(
      aux = stringr::str_detect(id, "_aux$"),
      id = stringr::str_remove(id, "_aux$")
    )

  resources <-
    tibble::tibble(
      # as.character() matters: dir_ls() returns fs_path, and bind_rows() below
      # would then coerce the URLs from additional-resources.csv into fs_path
      # too -- which normalises "https://" to "https:/" and breaks every link.
      resource = as.character(fs::dir_ls(resources_paths, glob = "*.qmd")),
      id = get_id_from_resource(resource),
      type = resource |> fs::path_dir(),
      aux = stringr::str_detect(fs::path_file(resource), "_aux_")
    ) |>
    dplyr::relocate(resource, .after = type)

  all_resources <- dplyr::bind_rows(resources, additional_resources) |>
    dplyr::mutate(
      type = type |>
        dplyr::replace_values(from = lookup$directory, to = lookup$type),
      type = type |>
        forcats::fct(levels = intersect(sorted_types, type))
    ) |>
    dplyr::arrange(type, aux)

  schedule |>
    dplyr::left_join(
      all_resources,
      by = dplyr::join_by(id),
      relationship = "one-to-many"
    ) |>
    dplyr::left_join(reveal_early, by = dplyr::join_by(id)) |>
    dplyr::mutate(
      date = convert_to_date(
        monday_of_first_term_week,
        week,
        as.character(slot)
      ),
      monday = lubridate::floor_date(date, unit = "week", week_start = "Mon"),
      current_week = is_current_week(date, current_date),
      # A lecture's deck appears on the day it is delivered -- otherwise Monday
      # would unlock the whole week. Friday is the exception: it is an async
      # video recorded right after Wednesday's class, so its deck is ready
      # then and reveals with Wednesday's. Nothing to maintain per week; the
      # slot decides.
      reveal_date = dplyr::if_else(
        as.character(slot) == "Fri",
        monday + lubridate::days(2),
        date
      ),
      reveal_date = pmin(reveal_date, early_reveal, na.rm = TRUE),
      show_week = dplyr::case_when(
        !rendering_student_profile ~ TRUE,
        week == 1 ~ TRUE,
        # Everything else reveals on its week's Monday, because for homework
        # and exams `date` is the DUE date and the work opens well before it.
        unit == "lecture" ~ reveal_date <= current_date,
        monday <= current_date ~ TRUE,
        .default = FALSE
      ),
      next_exam = dplyr::if_else(unit == "exam", date, NA),
      # Exam rows surface three weeks ahead so the Book button is there before
      # students need it. PrairieTest sittings open whenever they are created,
      # which is not a fixed offset -- 13 days was too tight, and left EX2
      # bookable for five days before the site offered a link to book it.
      show_exam = dplyr::between(
        next_exam,
        current_date,
        current_date + lubridate::days(21)
      ),
      .after = slot
    ) |>
    # `arrange()` ensures that fill()` propagates `next_exam` to prior dates
    dplyr::arrange(week, unit, slot, type, aux) |>
    tidyr::fill(next_exam, show_exam, .direction = "up") |>
    dplyr::filter_out(
      rendering_student_profile & type == "lesson-plan"
    ) |>
    dplyr::select(-early_reveal)
}

is_current_week <- function(date, current_date) {
  lubridate::floor_date(date, unit = "week", week_start = "Mon") ==
    lubridate::floor_date(current_date, unit = "week", week_start = "Mon")
}

is_future_week <- function(date, current_date) {
  lubridate::isoweek(date) > lubridate::isoweek(current_date)
}
