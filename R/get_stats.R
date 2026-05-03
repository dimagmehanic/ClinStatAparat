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

# Function to compute avareage
get_central <- function(x, ...) {
  mean <- mean(x, ...)  %>% as.character()
  median <- median(x, ...) %>% as.character()
  mode <- data.frame(var = x)%>% 
    filter(!is.na(var)) %>% 
    count(var) %>%
    filter(n == max(n)) %>% select(var) %>% 
    unlist() %>% paste(collapse = ", ")
    
  data.frame(
    Statistic = c("Mean", "Median", "Mode"),
    Value = c(mean, median, mode)
  )
}

# Function to compute variance
get_sd <- function(x, ...) {
  var <- var(x, ...)
  sd <- sd(x, ...)

  data.frame(
    Statistic = c("Variance", "Standard deviation"),
    Value = c(var, sd)
  )
}

# Function to compute quartiles
get_quartiles <- function(x, ...) {
  quantile(x) %>%
    {data.frame(Percentile = names(.), Value = as.numeric(.))}
}

# Function to compute IQR
get_iqr <- function(x, ...) {
  Q1 <- quantile(x, 0.25)
  median <- quantile(x, 0.5)
  Q3 <- quantile(x, 0.75)
  iqr <- IQR(x)

  lower_bound <- Q1 - 1.5 * iqr
  upper_bound <- Q3 + 1.5 * iqr

  lower_bound1 <- Q1 - 3 * iqr
  upper_bound1 <- Q3 + 3 * iqr

  data.frame(
    Statistic = c("Lower Outer fence", "Lower inner fence", "Q1",
                  "Median", "Q3", "Upper inner fence", "Upper outer fence"),
    Value = c(lower_bound1, lower_bound, Q1, median, Q3, upper_bound, upper_bound1)  # nolint
  )
}

# Function to compute Skewness
get_skewness <- function(x, na.rm = TRUE, ...) {

  args  <- list(na.rm = na.rm, ...)

  if (args$na.rm) {
    x <- x[!is.na(x)]
  }

  n <- length(x)
  m <- mean(x, na.rm = na.rm, ...)
  s <- sd(x, na.rm = na.rm, ...)

  skew <- sum(((x - m)^3) / (s^3)) / n

  return(skew) # nolint
}

# Function to compute Kurtosis
get_kurtosis <- function(x, na.rm = TRUE, ...) {

  args  <- list(na.rm = na.rm, ...)

  if (args$na.rm) {
    x <- x[!is.na(x)]
  }

  n <- length(x)
  m <- mean(x, na.rm = na.rm, ...)
  s <- sd(x, na.rm = na.rm, ...)

  kurtosis <- sum(((x - m)^4) / (s^4)) / n

  return(kurtosis) # nolint
}