# Function to compute range, min and max
get_range <- function(x) {
  min <- min(x)
  max <- max(x)
  range <- max - min

  data.frame(
    Statistic = c("Minimum", "Maximum", "Range"),
    Value = c(min, max, range)
  )
}