# Start with week 1 histogram app

# We will practice using the reactive()
     # function to update data.frames
     # used to make multiple outputs

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     sliderInput(inputId = "num",
                 label = "Choose a number",
                 value = 25,
                 min = 1,
                 max = 100),
     plotOutput("hist")
)

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)