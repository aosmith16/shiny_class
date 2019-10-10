# Start with minimal app

# We will read a dataset from outside
     # of R and display the top 6 lines
     # as a table

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(

)

# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)