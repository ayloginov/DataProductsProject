#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(readxl)
library(dplyr)
library(caret)
# Define server logic
shinyServer(function(input, output) {

    source("datatit.R")
    
    model_logit <- glm(data = t, survived ~ ., family = binomial(link = "logit"),
                    x = TRUE)
    
    model_logitpred <- reactive({
        ageInput <- input$sliderage
        fareInput <- input$sliderfare
        sexInput <- input$buttonsex
        parchInput <- input$numparch
        sibspInput <- input$numsibsp
        pclassInput <- input$pclass
        predict(model_logit, newdata = data.frame(age = ageInput, fare = fareInput,
                                                sex = sexInput, parch = parchInput,
                                                sibsp = sibspInput, pclass = pclassInput,
                                                age2 = ageInput^2, fare2 = fareInput^2))
        
            
})
    
    
    output$pred1 <- renderText({
        if(plogis(model_logitpred()) < 0.6) {"Predicted to die"}
        else {"Predicted to survive"}
    })
    
    output$pred3 = renderText({
        "Threshold used for predicting survival = 0.6"
    })
    
    output$pred2 = renderText({
        plogis(model_logitpred())
        })
})
