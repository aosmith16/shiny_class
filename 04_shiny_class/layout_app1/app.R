# Start with a sidebar layout 
     # with title panel as
     # shiny app template

# We'll add content to sidebar layout
# And then learn HTML tags to control
     # text and add links/images

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel(title = ""), # title of app
     sidebarLayout(
          sidebarPanel(
               # inputs
          ),
          mainPanel(
               # outputs
          )
     )
)

# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)