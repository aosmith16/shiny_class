# Start with week 1 histogram app

# We will practice different render
     # and output functions by adding on
     # to this app

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     sliderInput(inputId = "num",
                 label = "Choose a number",
                 value = 25,
                 min = 1,
                 max = 100),
     plotOutput(outputId = "hist")
)

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)