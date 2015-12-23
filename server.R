library(shiny)
library(UsingR)
library(googleVis)
library(XML)
library(grDevices)
library(graphics)
library(MASS)
library(RCurl)


url = getURL("https://en.wikipedia.org/wiki/List_of_countries_by_carbon_dioxide_emissions_per_capita")
CO2 <- readHTMLTable(url,which=2)

CO2 = CO2[, 1:20] # incomplete data from the years 2008 on
CO2 = CO2[-1,] # get rid of Qatar as its emissions are so great
CO2[CO2=='-'] = 1

names(CO2) = c("rank", "Country", 1990:2007)

cols = c(3:length(CO2));    
CO2[,cols] = apply(CO2[,cols], 2, function(x) as.numeric(as.character(x)))


shinyServer(
  function(input, output){
    output$G2 =renderGvis ({
      area = input$area
      year = input$year
      gvisGeoChart(data=CO2, 
                   locationvar="Country", 
                   colorvar=year,
                   options=list(region=area,
                                colorAxis="{colors:['lightgreen', 'crimson']}",
                                width = 600, height = 400)
                   )
    })
  }
)