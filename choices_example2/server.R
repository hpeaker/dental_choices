

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



server <- function(input, output, session) {
  observe(print(reactiveValuesToList(input)))
  
  callModule(choiceDataTable, "one", d1)
  callModule(choiceDataTable, "two", d2)
  callModule(choiceDataTable, "three", d3)
  callModule(choiceDataTable, "four", d4)
  
}

