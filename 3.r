calculate_fine <- function(days) {
  if (days <= 7) return(0)
  if (days <= 30) return((days - 7) * 2)
  return(50)
}

days <- as.integer(readline("Days overdue: "))
fine <- calculate_fine(days)

cat("Fine:", fine, "\n")
if (fine == 0) {
  cat("No fine. Thank you!\n")
  } else if (days > 30) {
    cat("Fine cap reached. Contact library.\n")
  } else {
    cat("Please pay the fine.\n")}

