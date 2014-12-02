library(shiny)
dist <- read.csv("data/Traveldistances.csv")

shinyServer(function(input, output) {
  output$bar <- renderPlot({

    yearchoose = switch(input$year,
                        "2010-2011" = "2010-2011",
                        "2011-2012" = "2011-2012",
                        "2013-2014" = "2013-2014",
                        "2014-2015" = "2014-2015") 
    
    variable = switch(input$var,
                      "Total Travel Distance" = "Miles",
                      "No. B2B Games" = "B2B_Games")
    
    #define variables
    plotvars = subset(dist,dist$Season == yearchoose)[[variable]]
    plotvarsdesc = plotvars[order(-plotvars)]
    teamdivs = subset(dist,dist$Season == yearchoose)[["Division"]]
    teamdivsdesc = teamdivs[order(-plotvars)]
    namesofteams = subset(dist,dist$Season == yearchoose)[["Team"]]
    namesofteamsdesc = namesofteams[order(-plotvars)]
    meanplotvars = mean(plotvars)
    colorcharts = ifelse(teamdivs=="Pacific", "#B0E2FF", ifelse(teamdivs=="Central", "#003c80", ifelse(teamdivs=="Metropolitan", "#ffcccc", "#ca0000")))
    colorchartsdesc = ifelse(teamdivsdesc=="Pacific", "#B0E2FF", ifelse(teamdivsdesc=="Central", "#003c80", ifelse(teamdivsdesc=="Metropolitan", "#ffcccc", "#ca0000")))
    #topindex = which.max(plotvars)
    #topindexdesc = which.max(plotvarsdesc)
    #bottomindex = which.min(plotvars)
    #bottomindexdesc = which.min(plotvarsdesc)
    #colorcharts = ifelse(plotvars==plotvars[topindex], "#00637F", ifelse(plotvars==plotvars[bottomindex], "#B3EEFF", "grey"))
    #colorchartsdesc = ifelse(plotvarsdesc==plotvarsdesc[topindexdesc], "#00637F", ifelse(plotvarsdesc==plotvarsdesc[bottomindexdesc], "#B3EEFF", "grey"))
    
    sortargs = switch(input$sortfxn,
                      "Team Name" = list(plotvars, namesofteams, colorcharts),
                      "Descending Value" = list(plotvarsdesc, namesofteamsdesc, colorchartsdesc))
    
    #create plot
    barplot(sortargs[[1]], 
            names.arg = sortargs[[2]], 
            ylim = c(0,max(dist[[variable]])), 
            las = 2, 
            col = sortargs[[3]],
            cex.names = .9)
    abline(h=meanplotvars, col = "red", lty = 2, lwd = 2)
  })

})