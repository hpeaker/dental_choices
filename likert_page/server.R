

server <- function(input, output, session) {
  l <- callModule(likertQuestions, "likert")
  output$text <- renderText(l())
}


