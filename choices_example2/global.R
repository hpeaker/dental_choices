

library(conjoint)
library(DT)
library(shinyjs)
library(shiny)
library(devtools)
library(dplyr)
library(digest)
library(likert)
library(ggplot2)
library(ggmap)

source("choiceDataTable.R")
source("likertQuestions.R")

NUM_PAGES <- 4

likert_questions <- paste("Question", 1:10)
likert_choices <- c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")

fieldsMandatory <- c("var1", "id", "radio")

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <-
  ".mandatory_star { color: red; }"

fieldsAll <- c("var1", "id", "block1", "gender", "age")

responsesDir <- file.path("responses")
epochTime <- function() {
  as.integer(Sys.time())
}

responses_file_path <- file.path("responses", list.files("responses"))
list_responses <- lapply(responses_file_path, read.csv)
responses_df <- do.call(what = rbind, args = list_responses)
dat.frame<-as.data.frame(responses_df)

