server <- function(input, output, session) {
  # Server logic
  data <- reactive({
    req(input$dataset)
    adam[[input$dataset]]()
  })

  output$table <- renderDataTable(data(), options = list(pageLength = 25))

  session$onSessionEnded(function() { stopApp() })
}
