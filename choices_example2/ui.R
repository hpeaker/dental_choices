

library(conjoint)
library(DT)

source("choiceDataTable.R")



ui <- fluidPage(
  choiceDataTableUI("one"),
  choiceDataTableUI("two"),
  choiceDataTableUI("three"),
  choiceDataTableUI("four")
)
