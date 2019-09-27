# App that runs but has error message
     # and doesn't show output

# Solution:
     # I defined the slider inputID as "Num" (with uppercase "N")
          # but used input$num (note lowercase "n")
          # in rnorm() in the server function
     # Change to rnorm(input$Num)

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("Example histogram app"),
     sidebarLayout(
          sidebarPanel(
               sliderInput(inputId = "Num",
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
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)