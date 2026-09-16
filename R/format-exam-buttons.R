source(here::here("R", "format-id.R"))

format_exam_buttons <- function(id, resource) {
  id <- format_id(id)
  book <- glue::glue("Book {id} on PrairieTest")
  practice <- glue::glue("Practice for {id} on PrairieLearn")

  prairietest <- yaml::read_yaml("_variables.yml")$course$prairietest

  book_button <- glue::glue(
    '<a class="exam-button" href="{prairietest}" ',
    'title="{book}" aria-label="{book}">Book</a>'
  )

  practice_button <- glue::glue(
    '<a class="exam-button" href="{resource}" ',
    'title="{practice}" aria-label="{practice}">Practice</a>'
  )

  # Booking and practice become available at different times, so they are
  # gated separately. The PrairieTest course page is live all term, so Book
  # always renders; a practice set is released per examlet, so Practice waits
  # until `resource` names one. Vectorised -- this is called from mutate().
  dplyr::if_else(
    dplyr::coalesce(resource, "TBD") == "TBD",
    as.character(book_button),
    as.character(glue::glue("{book_button} {practice_button}"))
  )
}
