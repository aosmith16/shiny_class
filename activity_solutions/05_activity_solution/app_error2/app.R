# App with instructive error message

# Solution:
     # I didn't use a reactive function for reactive input
     # Add renderPlot() in server function

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("Example histogram app"),
     sidebarLayout(
          sidebarPanel(
               sliderInput(inputId = "num",
                           label = "Choose a number of samples",
                           value = 25,
                           min = 1,
                           max = 100)
               ),
          mainPanel(
               plotOutput(outputId = "hist")
               )
          )
     )

# Server function
server = function(input, output) {
     output$hist = ({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)