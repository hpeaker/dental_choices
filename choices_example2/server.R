

experiment <- expand.grid(
  price = c("low","medium","high"),
  variety = c("black","green","red"),
  kind = c("bags","granulated","leafy"),
  aroma = c("yes","no")
)

df1 <- data.frame(
  Attributes = c("Price", "Colour", "Kind", "Aroma"),
  Alternative1 = t(experiment[1,]),
  Alternative2 = t(experiment[10,])
)

colnames(df1) <- c("Attributes", "Alternative 1", "Alternative 2")

design<-caFactorialDesign(data=experiment,type="orthogonal")

d <- as.data.frame(t(as.data.frame(design)))

d$Attributes <- rownames(d)
d1 <- d[, c("Attributes", "4", "9")]
names(d1) <- c("Attributes", "Alternative 1", "Alternative 2")

d2 <- d[, c("Attributes", "4", "10")]
names(d2) <- c("Attributes", "Alternative 1", "Alternative 2")
d3 <- d[, c("Attributes", "4", "17")]
names(d3) <- c("Attributes", "Alternative 1", "Alternative 2")
d4 <- d[, c("Attributes", "4", "21")]
names(d4) <- c("Attributes", "Alternative 1", "Alternative 2")

d5 <- d[, c("Attributes", "4", "23")]
names(d5) <- c("Attributes", "Alternative 1", "Alternative 2")
d6 <- d[, c("Attributes", "4", "29")]
names(d6) <- c("Attributes", "Alternative 1", "Alternative 2")
d7 <- d[, c("Attributes", "4", "42")]
names(d7) <- c("Attributes", "Alternative 1", "Alternative 2")
d8 <- d[, c("Attributes", "4", "52")]
names(d8) <- c("Attributes", "Alternative 1", "Alternative 2")




server <- function(input, output, session) {
  
  rv <- reactiveValues(page = 1)
  
  observe({
    toggleState(id = "prevBtn", condition = rv$page > 1)
    toggleState(id = "nextBtn", condition = rv$page < NUM_PAGES)
    hide(selector = ".page")
    show(sprintf("step%s", rv$page))
  })
  
  navPage <- function(direction) {
    rv$page <- rv$page + direction
  }
  
  observeEvent(input$prevBtn, navPage(-1))
  observeEvent(input$nextBtn, navPage(1))
  
  callModule(choiceDataTable, "one", d1)
  callModule(choiceDataTable, "two", d2)
  callModule(choiceDataTable, "three", d3)
  callModule(choiceDataTable, "four", d4)
  
  callModule(choiceDataTable, "five", d5)
  callModule(choiceDataTable, "six", d6)
  callModule(choiceDataTable, "seven", d7)
  callModule(choiceDataTable, "eight", d8)
  
}

