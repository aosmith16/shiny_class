# Start with app that has read in packages
     # and data

# Load packages
library(shiny)
library(ggplot2) # plotting
library(dplyr) # data manip

# Read data
dat = read.csv("scatter_dat.csv")

# We will talk about input selection 
     # for plotting subsets

# The main focus of this app is on "tooltips" 
     # for interactive plots
     # (hover, click, brush)

# See articles for more advanced work:
      # https://shiny.rstudio.com/articles/plot-interaction.html
      # https://shiny.rstudio.com/articles/selecting-rows-of-data.html

# User interface
ui = fluidPage(
     titlePanel("Interactive plots"),
     sidebarLayout(
          sidebarPanel(
               selectInput(inputId = "pick",
                           label = "Choose a group to plot:",
                           choices = c("A" = "a",
                                       "B" = "b",
                                       "C" = "c") )
               ),
               mainPanel(
                    plotOutput("scatter")
               )
          )
)
     
# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)