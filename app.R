library(dplyr)
library(ggplot2)
library(corrplot)
library(readr)
library(caret)
library(reshape)
library(arm)
#library(LiblineaR)
do.call(library, list(package = LiblineaR, character.only = TRUE))
library(shiny)
#library(shinydashboard)

data("ChickWeight")

data <- ChickWeight


inTrain <- createDataPartition(data$weight, p = .75, list = F)

train <- data[inTrain,]
test <- data[-inTrain,]

train_lm <- train[,-3]

linear_model <- train(weight~., data = train_lm, method = "lm" )

gradient_boosted_machine <- train(weight~., data = train, method = "gbm", verbose = F )
random_forest <- train(weight~., data = train, method = "rf")
elastanet <- train(weight~., data = train, method = "enet")
partial_least_squares <- train(weight~., data = train, method = "pls")
support_vector_machine <- train(weight~., data = train, method = "svmLinear3")

mods_all <- list(linear_model=linear_model,
                 gradient_boosted_machine=gradient_boosted_machine,
                 random_forest = random_forest, partial_least_squares = partial_least_squares,
                 elastanet= elastanet,support_vector_machine = support_vector_machine)



models <- c("linear_model", "gradient_boosted_machine", 
            "random_forest", "elastanet", "partial_least_squares",
            "support_vector_machine")


ui <- fluidPage(
    shiny::sidebarLayout(

      sidebarPanel(
    shiny::selectInput("model1", "Select First model:", models),
    shiny::selectInput("model2", "Select Comparison model:", models, selected ="elastanet" ),
    
    shiny::sliderInput(inputId = "xLowLim",label = "Change x lower bounds",
                       min = -50, max = 50, value = 0),
    
    shiny::sliderInput(inputId = "xUpperLim",label = "Change x upper bounds",
                       min = 50, max = 350, value = 275),
    
    
    shiny::sliderInput(inputId = "yLowLim",label = "Change y lower bounds",
                       min = -150, max = -50, value = -150),
    
    shiny::sliderInput(inputId = "yUpperLim",label = "Change y upper bounds",
                       min = 50, max = 175, value = 150)
      ),
    
  mainPanel(
    plotOutput("plot1"),
    plotOutput("plot2")
  )
  
    )
)


server <- function(input, output) {
  
  output$plot1 <- renderPlot({ test1 <- test
  model1 <- mods_all[[input$model1]]
  
  pred <- predict(model1, test)
  
  y.hat1 <- pred
  u1 <- test1$weight - pred
  sigma1 <- sd(u1)
  
  residual.plot(y.hat1, u1, sigma1, main = input$model1, 
                xlim = c(input$xLowLim, input$xUpperLim),
                ylim = c(input$yLowLim, input$yUpperLim))
  })
  
  output$plot2 <- renderPlot({ test1 <- test
  model2 <- mods_all[[input$model2]]
  
  pred <- predict(model2, test)
  
  y.hat2 <- pred
  u2 <- test1$weight - pred
  sigma2 <- sd(u2)
  
  residual.plot(y.hat2, u2, sigma2, main = input$model2, 
                xlim = c(input$xLowLim, input$xUpperLim),
                ylim = c(input$yLowLim, input$yUpperLim))
  
  
  })
}

shinyApp(ui, server)

