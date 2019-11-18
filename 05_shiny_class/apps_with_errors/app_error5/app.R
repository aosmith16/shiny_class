# App that won't run due to error
# The error message is unclear

# 2019-11 This no longer causes an error

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
               )
          ),
     )

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)