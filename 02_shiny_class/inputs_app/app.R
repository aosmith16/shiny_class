# Start with a minimal shiny app

# We will practice adding different
     # input functions to the UI

# Also see the Widget gallery:
     #  http://shiny.rstudio.com/gallery/widget-gallery.html

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