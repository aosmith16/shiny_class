# App that fails with error message
     # and gives some indication of what the problem is

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
               plotOutput(outputId = "hist")
               )
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