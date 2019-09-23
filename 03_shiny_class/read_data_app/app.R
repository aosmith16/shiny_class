# Here is an app to show
     # that data can be read from 
     # within app folder

# Load package shiny
library(shiny)

# Read in dataset from same directory
# May want to store in data folder
dat = read.csv("scatter_dat.csv")

# User interface
ui = fluidPage(
     # Add tableOutput to show data as output
)

# Server function
server = function(input, output) {
     # Use renderTable to show first 6 lines
     output$dat = renderTable({
          
          })
     
}

# Create app object
shinyApp(ui = ui, server = server)