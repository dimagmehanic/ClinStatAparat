# Function to compute number of observations and missing records
get_obs <- function(x) {
  n <- length(x)
  miss <- sum(is.na(x))
  nonmiss <- sum(!is.na(x))

  data.frame(
    Metric = c("Total", "Missing", "Non-missing", "Missing (%)", "Non-missing (%)"), # nolint
    Value = c(
      n,
      miss,
      nonmiss,
      round(miss / n * 100, 2),
      round(nonmiss / n * 100, 2)
    )
  )
}