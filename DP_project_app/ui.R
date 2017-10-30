#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict survival on the Titanic"),
  
  # Sidebar with a slider input for age 
 
  sidebarLayout(
    sidebarPanel(
        radioButtons("buttonsex", "Select passenger gender:",
                     c("Male" = "male",
                       "Female" = "female")),
        sliderInput("sliderage",
                   "Select passenger age:",
                   min = 1,
                   max = 80,
                   value = 30),
    
       numericInput("numparch", "Number of children or parents aboard", 
                    value = 0, min = 0, max = 9, step = 1),
       numericInput("numsibsp", "Number of siblings/spouses aboard", 
                    value = 0, min = 0, max = 8, step = 1),
       radioButtons("pclass", "Passenger class:",
                    c("First" = "1",
                      "Second" = "2",
                      "Third" = "3")),
       sliderInput("sliderfare",
                   "Passenger fare:",
                   min = 0,
                   max = 513,
                   value = 50)
       
       ),
    
    # Show results
    mainPanel(
        tabsetPanel(type="tabs", 
        tabPanel("Main", br(), 
            h3("Chance of survival from logistic regression model"),
            textOutput("pred2"),
            
            textOutput("pred3"),
            
            h3("Prediction"),
            textOutput("pred1")),
        
        tabPanel("Readme documentation", br(), 
                 
                 
                 p("The app illustrates the influence of different parameters, 
                   such as gender, age, passenger class, etc. on the chance of 
                   survival for Titanic passengers."),
                 
                 p("The app allows to input parameters for a hypothetic Titanic 
                    passenger using the sidebar panel on the left and predict 
                    survival of such passenger using logistic regression model."),
                 
                 p("The app uses the Titanic dataset from the Biostatistics 
                   Department of the Vanderbilt University."), 
                 
                 p("The data can be downloaded from the following page 
                   (dataset name is 'Data for Titanic passengers')",
                   a("http://biostat.mc.vanderbilt.edu/wiki/Main/DataSets")),
                 
                 p("The description of the dataset can be found here:",
                   a("http://biostat.mc.vanderbilt.edu/wiki/pub/Main/DataSets/titanic3info.txt"))
                 
                 
                 )
        
        
        
        
        )
    )
  )
))
