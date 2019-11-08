# Start with app that has read in packages
     # and data

# Load packages
library(shiny)
library(ggplot2) # plotting
library(dplyr) # data manip

# Read data
dat = read.csv("scatter_dat.csv")

# We will talk about selecting groups via inputs 
     # for plotting subsets of data

# See articles for info on making interactive plots:
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
                    # output
               )
          )
)
     
# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)