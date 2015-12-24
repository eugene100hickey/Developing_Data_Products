library(shiny)
library(UsingR)
library(googleVis)
library(XML)
library(grDevices)
library(graphics)
library(MASS)


shinyUI(pageWithSidebar(
  headerPanel("Carbon Dioxide Emissions per Capita in Metric Tonnes"),
  sidebarPanel(
    radioButtons(inputId = "area", 
                 label = "Choose Region",
                 choices = c("World" = "world",
                             "Europe" = "150",
                             "Asia" = "142",
                             "North America" = "021",
                             "South America" = "005",
                             "Africa" = "002",
                             "Oceania" = "009")
                 ),
    sliderInput('year', 'Choose Year',value = 2000, min = 1990, max = 2007, step = 1,sep="", animate=T)
    ),
  mainPanel(
    htmlOutput("G2")
  )
))