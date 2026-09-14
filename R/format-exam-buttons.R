source(here::here("R", "format-id.R"))

format_exam_buttons <- function(id, resource) {
  # Nothing to link to yet: the PrairieTest sitting may not exist and the
  # practice set may not have been released. Emit no buttons rather than
  # buttons that go nowhere useful.
  if (is.na(resource) || resource == "TBD") {
    return("")
  }

  id <- format_id(id)
  book <- glue::glue("Book {id} on PrairieTest")
  practice <- glue::glue("Practice for {id} on PrairieLearn")

  glue::glue(
    '<a class="exam-button" href="https://us.prairietest.com" ',
    'title="{practice}" aria-label="{book}">Book</a> ',
    '<a class="exam-button" href="{resource}" ',
    'title="{practice}" aria-label="{practice}">Practice</a>'
  )
}
