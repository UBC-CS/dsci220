# Examlets are self-scheduled in PrairieTest across a four-day window,
# Thursday through Sunday of their week. Only the Sunday is in
# `data/schedule.csv`, since that is the last day the sitting can be booked, so
# the window is the three days leading up to it. Showing just the Sunday reads
# as a deadline and hides the three days students can actually pick from.
#
# The final is scheduled by the Registrar in the December exam period, not on a
# Thursday-to-Sunday pattern, and its schedule row carries a placeholder date
# until that is published -- so it keeps the single-date form.
format_exam_window <- function(date, id, slot) {
  start <- date - lubridate::days(3)

  start_label <- gt::vec_fmt_date(start, date_style = "MMMd")
  end_label <- gt::vec_fmt_date(date, date_style = "MMMd")

  window <- dplyr::if_else(
    lubridate::month(start) == lubridate::month(date),
    # Same month, so the month name does not need repeating: "Sep 24-27".
    paste0(start_label, "–", lubridate::day(date)),
    # Straddles a month boundary: "Oct 29 - Nov 1".
    paste0(start_label, " – ", end_label)
  )

  dplyr::if_else(
    id == "exam-final",
    paste(slot, end_label),
    window
  )
}
