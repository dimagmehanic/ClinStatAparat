# Load the necessary library
library(shiny)

table <- tabPanel("data",
                  titlePanel("Dataset"),
                  sidebarLayout(
                    sidebarPanel(
                      fileInput("upload", NULL, accept = c(".csv", ".tsv")),
                      selectInput("dataset", "ADaM", names(adam) %>% sort())
                    ),
                    mainPanel(
                      dataTableOutput("table")
                    )
                  ))

scatter <- tabPanel("Scatter Plot",
                    titlePanel("CDISC ADaMs"),
                    sidebarLayout(
                      sidebarPanel(
                        fileInput("upload", NULL, accept = c(".csv", ".tsv")),
                        selectInput("dataset", "ADaM", names(adam) %>% sort())
                      ),
                      mainPanel(
                        plotOutput("scatter")
                      )
                    ))


ui <- fluidPage(
  navlistPanel(
    id = "tabset",
    "Simple Linear Regression", table, scatter
    ,
    "Multiple",
    tabPanel("panel 2", "Panel two contents"),
    tabPanel("panel 3", "Panel three contents")
  )
)