format_homework_link <- function(id, resource) {
  id <- stringr::str_remove(id, "homework-0{0,1}")

  glue::glue(
    '<div class="hidden-placeholder">Placeholder</div>',
    '<div><a href="{resource}">',
    '{fontawesome::fa("pen-to-square")} Homework&nbsp;{id}',
    '</a></div>'
  )
}
