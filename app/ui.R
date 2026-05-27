table <- tabPanel(
  "Dataset",
  titlePanel("Dataset"),
  fluidRow(
    column(6, fileInput("upload", NULL, accept = c(".csv", ".tsv"))),
    column(6, selectInput("dataset", "ADaM", names(adam) %>% sort()))
  ),
  fluidRow(dataTableOutput("table"))
)

scatter <- tabPanel("Scatter Plot",
                    titlePanel("Scatter Plot",),
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
  tabsetPanel(
    id = "tabset",
    table,
    # "Simple Linear Regression",
    scatter,
    # "Multiple",
    tabPanel("panel 2", "Panel two contents"),
    tabPanel("panel 3", "Panel three contents")
  )
)