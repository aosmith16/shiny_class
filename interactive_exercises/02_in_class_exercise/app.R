# Start with minimal shiny app

# We will practice adding different
     # input functions to the UI

# Input functions to cover:
     # numericInput()
     # selectInput()
     # helpText()
     # sliderInput()

# I put app code for all input functions/widgets
     # into app "all_input_functions"

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     
     # Show numeric input with value = 1
     # Add in min, max, step to control possible values
     # Demonstrate message can get if go below min, etc.
     numericInput(inputId = "num",
                  label = "Enter number",
                  value = 6,
                  min = 0,
                  max = 10,
                  step = 2),
     
     # Add helpText() third
     # Note that help text isn't true widget
     # Show that has no ID
     # Put in one or more text strings;
          # it always wraps
     # Line breaks can be done with br() function
     helpText("Numbers must be positive and even,",
              br(),
              "starting at 0"),
     
     # Make drop-down menu of selections
     # Start with 2 choices, yes and no
     # Use selected to choose something other than first value
     # Show adding names to list of values
     # Add third option
     # Use multiple = TRUE, default selected is NULL
     selectInput(inputId = "choose",
                 # label = "Select one option below",
                 label = "Select options below",
                 choices = c("Yes" = "yes",
                             "No" = "no",
                             "Maybe" = "other"),
                 # selected = "no",
                 multiple = TRUE),

     # Show single slider (repeat from week 1)
     # Show error message if leave out value/min/max
     # Put in two values for double-sided slider
     # Use "step" for non-integers
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