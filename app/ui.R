# Load the necessary library
library(shiny)

ui <- fluidPage(
  # Application title
  titlePanel("CDISC ADaMs"),
  selectInput("dataset", "ADaM",
              names(adam) %>% sort()),
  dataTableOutput("table")
)