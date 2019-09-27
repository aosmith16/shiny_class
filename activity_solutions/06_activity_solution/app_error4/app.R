# App that fails with error message
     # and gives some indication of what the problem is

# Solution:
     # sliderInput() requires the "label" argument,
          # which I forgot to include
     # Add a label in sliderInput() to run the app

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("Example histogram app"),
     sidebarLayout(
          sidebarPanel(
               sliderInput(inputId = "num",
                           value = 25,
                           min = 1,
                           max = 100)
               ),
          mainPanel(
               plotOutput("hist")
               ),
          )
     )

# Server function
server = function(input, output) {
     output = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)