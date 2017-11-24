

library(shiny)
library(devtools)
library(shinyjs)
library(dplyr)
library(digest)

fieldsMandatory <- c("var1", "id","block1")

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <-
  ".mandatory_star { color: red; }"

fieldsAll <- c("var1","id","block1")
responsesDir <- file.path("responses")
epochTime <- function() {
  as.integer(Sys.time())
}

formData <- reactive({
  data <- sapply(fieldsAll, function(x) input[[x]])
  data <- c(data, timestamp = epochTime())
  data <- t(data)
  data
})
