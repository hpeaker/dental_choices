

ui <- fluidPage(
  likertQuestionsInput("likert", questions = c("Question 1", "Question 2", "Question 3"), selected = "Neutral"),
  textOutput("text")
)
