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
        style = "font-size: 7pt"),
      p("* Files on", 
        a("Github", href="https://github.com/phister/Traveldistances"), 
        style = "font-size: 7pt")
      ),
    
    mainPanel(
      plotOutput("bar", height = "500px"),
      br(),
      h4("Notes"),
      tags$ol(
        tags$li("Data is ordered by default from highest to lowest. Use the 'Sort By' dropdown to order by Team Name."),
        tags$li("The", strong(span("dotted red line", style="color:red")), "indicates the average value for that given year."), 
        tags$li("Teams are highlighted by their divisions. The color scheme is as follows:", strong(span("Pacific,", style="color:#B0E2FF")), strong(span("Central,", style="color:#003c80")), strong(span("Metropolitan,", style="color:#ffcccc")), strong(span("Atlantic.", style="color:#ca0000"))),
        tags$li("Data from the 2012-2013 NHL season is omitted due to the lockout.")
      )
    ),
  )
))