# Function to compute range, min and max
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
