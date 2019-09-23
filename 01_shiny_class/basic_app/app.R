# Start with a minimal shiny app template

# We'll build an app, 
     # adding an input and an output 
     # function to the user interface

# Load package shiny
library(shiny)

# User interface
ui <- fluidPage(
     
)

# We'll add a reactive function that takes
     # the reactive input into the server function

# Server function
server <- function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)