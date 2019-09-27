# App that won't run due to error
# The error message is unclear

# Solution:
     # I put a comma after sliderInput() 
          # but did not add an additional element
          # into the sidebarPanel()
     # Delete this comma to run the app

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
                           max = 100),
               ),
          mainPanel(
               plotOutput("hist")
               ),
          )
     )

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)