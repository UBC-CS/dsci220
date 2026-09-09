format_id <- function(id) {
  id <- id |>
    stringr::str_replace("-0{0,1}", " ")

  dplyr::if_else(
    stringr::str_detect(id, "exam final"),
    "Final exam",
    stringr::str_to_sentence(id)
  )
}
