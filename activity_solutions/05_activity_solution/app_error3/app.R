# App that runs with no error message
     # but has no output

# Solution:
     # I forgot to assign the output plot a name
          # in the server function
     # I should have written output$hist
          # but instead just wrote output

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
               plotOutput("hist")
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