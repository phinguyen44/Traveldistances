library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application Title
  titlePanel("NHL Team Travel Distances & B2B Games by Season"),
  plotOutput("bar", height = "600px"),
  textOutput("text2"),
  hr(),
  
  # fluid row layout
  fluidRow(
    column(4,
           h4("Variab"),
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
             style = "font-size: 7pt")
           ),
    column(4,
           selectInput("year", 
                       label = h5("Select a Season:"), 
                       choices = list("2010-2011", "2011-2012", "2013-2014", "2014-2015"), 
                       selected = "2014-2015")
           ),
    column(4,
           selectInput("var", 
                       label =h5("Select Variable:"), 
                       choices = list("Total Travel Distance", "No. B2B Games"), 
                       selected = "Total Travel Distance")
           ) 
    )
))