# This is the app for students
     # to recreate as an in-class activity
     # where they practice render and output functions

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     helpText("Create heatmaps of average",
              br(),
              " tree height across a stand"),
     sliderInput(inputId = "slide",
                 label = "Choose tree size (DBH, inches)",
                 value = c(30, 40),
                 min = 10,
                 max = 50),
     selectInput(inputId = "choose",
                 label = "Select one species to plot:",
                 choices = c("Douglas-fir",
                             "Western hemlock",
                             "Bigleaf maple",
                             "Red alder") ),
     textOutput(outputId = "select"),
     textOutput(outputId = "max")
)

# Server function
server = function(input, output) {
     output$select = renderText({
          paste("You selected", input$choose)
     })
     output$max = renderText({
          paste("You have chosen trees from",
                input$slide[1],
                "to",
                input$slide[2],
                "inches DBH")
     })
}

# Create app object
shinyApp(ui = ui, server = server)