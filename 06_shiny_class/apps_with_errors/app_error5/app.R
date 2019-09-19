# App that runs with no error message
     # but has no output

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
               ),
          )
     )

# Server function
server = function(input, output) {
     output = renderPlot({
          hist( rnorm(input$num), main = input$title )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)