library(shiny)
library(dplyr)
require(RCurl)
source("~/Dropbox/Data Science Specialisation/FootballData/statGoals/helper.R")
eplMelt <- readRDS("~/Dropbox/Data Science Specialisation/FootballData/statGoals/Data/epl.rds")

# Define server logic required to output a plot
shinyServer(function(input, output) {
  output$text1 <- renderText({
    paste("The stat you chose was", input$select," and you wish to asesss",
          input$radio1,". You chose to focus on",
          input$select1," when the team(s) played", input$radio,"from 2000 to 2014.")
  })

  output$plot1 <- renderPlot({
     
    club <- input$select1
      
    stat <- switch(input$select,
                   "Shots"="Shots", 
                   "Shots on Target"="ShotsOn",
                   "Corners"="Corners", 
                   "Fouls"="Fouls", 
                   "Yellow Cards"="Yellows", 
                   "Red Cards"="Reds")
    
    loc <- switch(input$radio,
                  "Home" = "Home",
                  "Away" = "Away",
                  "Home & Away" = "Both")
      
    metric <- switch(input$radio1,
                     "Mean Points" = "meanPoints",
                     "Mean Goals" = "meanGoals")
     
    goalsPerStat(club=club, 
                 stat=stat,
                 loc=loc,
                 metric=metric) 
    
      })
})