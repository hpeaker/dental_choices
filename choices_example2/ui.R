


ui <- fluidPage(
  useShinyjs(),
  hidden(
    list(
      div(class = "page",
          id = paste0("step", 1),
          sidebarLayout(
            sidebarPanel(
              sliderInput("var1", labelMandatory("how many times are you brushing your teeth every month?"),
                          0, 60, 2, ticks = FALSE),
              textInput("id", "How often do you use flossing per month", ""),
              # Make a list of checkboxes
              radioButtons("radio", label = h3("Radio buttons"),
                           choices = list("Choice 1" = 1, "Choice 2" = 2))
            ),
            mainPanel(plotOutput("distPlot"), textOutput("message"))
          )
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
          fluidPage(
            column(12, align = "center",
              div(
                id = "likert_input",
                likertQuestionsInput("likert", questions = paste("Question", 1:10), choices = likert_choices,
                                     selected = "Neutral"),
                actionButton("submit", "Submit", class = "btn-primary")
              ),
              shinyjs::hidden(
                div(
                  id = "thankyou_msg",
                  h3("Thanks, your response was submitted successfully!"),
                  plotOutput("likert_plot")
                )
              )
            )
          )
      )
    )
  ),
  br(),
  column(12, align = "center",
    actionButton("prevBtn", "< Previous"),
    actionButton("nextBtn", "Next >")
  )
)

