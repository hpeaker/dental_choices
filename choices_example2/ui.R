


ui <- fluidPage(
  useShinyjs(),
  #hidden(
    list(
      div(class = "page",
          id = paste0("step", 1),
          sidebarLayout(
            sidebarPanel(
              sliderInput("var1", labelMandatory("how many times are you brushing your teeth every month?"),
                          0, 60, 2, ticks = FALSE),
              textInput("id", "How often do you use flossing per month", ""),
              # Make a list of checkboxes
              radioButtons("live_uk", "Do you live in the United Kingdom?",
                           choices = c("Yes", "No")),
              hidden(
                selectInput("city", "Which city do you live in (or nearest)",
                          choices = c("Edinburgh", "Leeds", "London", "Prefer Not to Say"))
              ),
              # radioButtons("radio", label = h3("Radio buttons"),
              #              choices = list("Choice 1" = 1, "Choice 2" = 2)),
              selectInput("gender", labelMandatory("What is your gender?"),
                          choices = c("Female", "Male", "Other", "Prefer Not to Say")),
              sliderInput("age", labelMandatory("How old are you?"), min = 12, max = 100, value = 50),
              selectInput("profession", "What is your current profession?",
                          choices = c("Technical", "Sales", "Education", "Other"))
            ),
            mainPanel(plotOutput("distPlot"), textOutput("message"))
          )
      ),
      div(class = "page",
          id = paste0("step", 2),
          sidebarLayout(
            sidebarPanel(
              radioButtons("smoker", "Are you a smoker?", choices = c("Yes", "No")),
              radioButtons("drink", "Do you drink alcohol?", choices = c("Yes", "No")),
              radioButtons("chronic_diseases", "Do you have any chronic health conditions", choices = c("Yes", "No"))
            ),
            mainPanel(plotOutput("map"))
          )
      ),
      div(class = "page",
          id = paste0("step", 3),
          choiceDataTableUI("one"),
          choiceDataTableUI("two"),
          choiceDataTableUI("three"),
          choiceDataTableUI("four")
      ),
      div(class = "page",
          id = paste0("step", 4),
          choiceDataTableUI("five"),
          choiceDataTableUI("six"),
          choiceDataTableUI("seven"),
          choiceDataTableUI("eight")
      ),
      div(class = "page",
          id = paste0("step", 5),
          fluidPage(
            column(12, align = "center",
              div(
                id = "likert_input",
                likertQuestionsInput("likert", questions = likert_questions, choices = likert_choices,
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
    #)
  ),
  br(),
  div(id = "pager",
    column(12, align = "center",
      actionButton("prevBtn", "< Previous"),
      actionButton("nextBtn", "Next >")
    )
  )
)

