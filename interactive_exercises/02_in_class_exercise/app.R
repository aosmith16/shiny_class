# Start with minimal shiny app

# We will practice adding different
     # input functions to the UI

# Input functions to cover:
     # numericInput()
     # helpText()
     # sliderInput()
     # selectInput()

# I put app code for all input functions/widgets
     # into app in folder "all_input_functions"

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     # Show numeric input with value
     # Add in min, max, step to show
     # Demonstrate message can get if go below min, etc.
     numericInput(inputId = "num",
                  label = "Enter number",
                  value = 6,
                  min = 0,
                  max = 10,
                  step = 2),
     # For help text show that has no ID
     # Put in one or more text strings
     # Line breaks can be done with br() function
     helpText("Numbers must be positive and even,",
              br(),
              "starting at 0"),
     # Show single slider
     # Show error message if leave out value/min/max
     # Put in two values for double-sided slider
     # Use "step" for non-integers
     sliderInput(inputId = "slide",
                 label = "Choose minmum and maximum value",
                 value = c(10, 20),
                 min = 0,
                 max = 50,
                 step = 0.01),
     # Make drop-down menu of selections
     # Start with 2 choices
     # Show adding names to list of values
     selectInput(inputId = "choose",
                 label = "Select one option below",
                 choices = c("Yes" = "yes",
                             "No" = "no",
                             "Maybe" = "other") )
)

# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)