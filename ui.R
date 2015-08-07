library(shiny)

# UI for web app
shinyUI(fluidPage(
  titlePanel("The Goal Machine"),
  
  sidebarLayout(
    sidebarPanel(
      h3('How it Works'),
      p('Simply select the stat you are interested in from the drop-down menu below'),
      selectInput("select", label = h4("Select Stat"), 
                  choices = list("Shots", "Shots on Target",
                                 "Corners", "Fouls", 
                                 "Yellow Cards", "Red Cards"), selected = "Shots"),
      p('Now select whether you want Home or Away results'),
      radioButtons("radio", label = h4("Home or Away"), 
                         choices = list("Home", "Away", "Home & Away"),
                         selected = "Home & Away"),
      p('Now select the club you are interested in. The default selection is the League Average.'),
      selectInput("select1", label = h4("Select club"), 
                  choices = list("League Average", "Arsenal", "Aston Villa", "Birmingham", "Blackburn", 
                                 "Blackpool", "Bolton", "Bradford", "Burnley",
                                 "Cardiff", "Charlton", "Chelsea", "Coventry",
                                 "Crystal Palace", "Derby", "Everton", "Fulham",
                                 "Hull", "Ipswich", "Leeds", "Leicester",
                                 "Liverpool", "Man City", "Man United", "Middlesbrough",
                                 "Newcastle", "Norwich", "Portsmouth", "QPR",
                                 "Reading", "Sheffield United", "Southampton", "Stoke",
                                 "Sunderland", "Swansea", "Tottenham", "Watford",
                                 "West Brom", "West Ham", "Wigan", "Wolves"),
                                  selected = "League Average"),
      p('Finally, select either Mean Points or Mean Goals as your metric'),
      radioButtons("radio1", label = h4("Select Metric"),
                   choices = list("Mean Points", "Mean Goals"), selected = "Mean Points")
    ),
    mainPanel(
      p('This app was designed to illustrate the relationship between a variety
         of in-game stats and the mean number of goals and points accrued as a 
         league as a whole and by each individual team. Play around and you can 
         spot some interesting patterns. Perhaps unsurprisingly, Shots on Target
         appear closely related to goals and points, whereas Corners do not.'),
      br(),  
        p('As a starter, examine mean Points for both Arsenal and Wolves as Fouls
         increase. For the tippy-tappy Arsenal, mean points go down as they commit
         more fouls, whereas for blood-and-thunder Wolves, mean points go up.'),
      br(),
        p('See what else you can find.'),
      br(),
      strong(textOutput('text1')),
      br(),
      plotOutput('plot1'),
      br()
    )
  )
))