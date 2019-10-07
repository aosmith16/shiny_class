# Start with week 2 input app

# We will practice different render
     # and output functions by adding on
     # to the inputs app we made
     # in week 2

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     numericInput(inputId = "num",
                  label = "Enter number",
                  value = 6,
                  min = 0,
                  max = 10,
                  step = 2,
                  width = "100%"),
     
     helpText("Select one or more groups",
              br(),
              "from the drop-down menu below."),
     
     selectInput(inputId = "choose",
                 label = "Select groups to plot below",
                 choices = c("Yes" = "yes",
                             "No" = "no",
                             "Maybe" = "other"),
                 multiple = TRUE),

     sliderInput(inputId = "slide",
                 label = "Choose minmum and maximum value",
                 value = c(10, 20),
                 min = 0,
                 max = 50,
                 step = 0.01)
)

# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)