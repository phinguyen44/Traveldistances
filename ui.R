library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application Title
  titlePanel("NHL Team Travel Distances & B2B Games by Season"),

  # Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      selectInput("year", 
                  label = h5("Select a Season:"), 
                  choices = list("2010-2011", "2011-2012", "2013-2014", "2014-2015"), 
                  selected = "2014-2015"),
      
      selectInput("var", 
                  label =h5("Select Variable:"), 
                  choices = list("Total Travel Distance", "No. B2B Games"), 
                  selected = "Total Travel Distance"),
      
      selectInput("sortfxn",
                  label = h5("Sort by:"),
                  choices = list("Team Name", "Descending Value"),
                  selected = "Descending Value"),
      
      br(),
      img(src="nhllogo.gif", 
          height = 109, width = 96, 
          display = "block", 
          align = "center"),
      
      br(),
      br(),
      p("* Built by", 
        a("Phi Nguyen", href="http://www.phinguyen.co"), 
        "using data provided by ", 
        a("Dirk Hoag", href="https://twitter.com/forechecker"), 
        style = "font-size: 7pt")),
    
    mainPanel(
      plotOutput("bar", height = "500px"),
      br(),
      h4("Notes"),
      tags$ol(
        tags$li("Data is ordered from highest to lowest."),
        tags$li("The", strong(span("dotted red line", style="color:red")), "indicates the average value for that given year."), 
        tags$li("The team(s) highlighted in", strong(span("teal", style="color:#00637F")), "has the highest value for the chosen year, while the team(s) in", strong(span("cyan", style="color:#B3EEFF")), "has the lowest value."),
        tags$li("Data from the 2012-2013 NHL season is omitted due to the lockout.")
      )
    ),
  )
))