source("choice_help.R")

#install.packages("conjoint")
library(conjoint)

experiment<-expand.grid(
  price<-c("low","medium","high"),
  variety<-c("black","green","red"),
  kind<-c("bags","granulated","leafy"),
  aroma<-c("yes","no"))

design<-caFactorialDesign(data=experiment,type="orthogonal")


print(design)
d<-as.data.frame(design)

names(d)<-c( "price", "variety", "kind", "aroma")


exp<-function(data){
  split(data,rep(1:3,nrow(data)/3))
}
g<-exp(d)
g
names(g)<-c("alt1","alt2","alt3")

f1<-as.data.frame(g[1])
f2<-as.data.frame(g[2])
f3<-as.data.frame(g[3])




ui <- fluidPage(
  
  navbarPage("Title", id = "navbar",
             tabPanel("Choices 1", value = "choices1",
                      choices("block11", "Q1", f1),
                      choices("block12", "Q2", f2),
                      choices("block13", "Q3", f3),
                      
                      actionButton("submit1", "Submit", class = "btn-primary")
             ),
             tabPanel("Choices 2", value = "choices2",
                      choices("block21", "Q1", f1),
                      choices("block22", "Q2", f2),
                      choices("block23", "Q3", f3),
                      
                      actionButton("submit2", "Submit", class = "btn-primary")
             )
  )
)
