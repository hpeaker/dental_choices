


ui <- fluidPage(
  useShinyjs(),
  hidden(
    list(
      div(class = "page",
          id = paste0("step", 1),
          fluidRow()
      ),
      div(class = "page",
          id = paste0("step", 2),
          choiceDataTableUI("one"),
          choiceDataTableUI("two"),
          choiceDataTableUI("three"),
          choiceDataTableUI("four")
      ),
      div(class = "page",
          id = paste0("step", 3),
          choiceDataTableUI("five"),
          choiceDataTableUI("six"),
          choiceDataTableUI("seven"),
          choiceDataTableUI("eight")
      ),
      div(class = "page",
          id = paste0("step", 4),
          fluidRow()
      )
    )
  ),
  br(),
  column(12, align = "center",
    actionButton("prevBtn", "< Previous"),
    actionButton("nextBtn", "Next >")
  )
)

