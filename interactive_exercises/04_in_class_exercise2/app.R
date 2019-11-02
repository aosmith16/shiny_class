# In the second in-class exercise
     # we'll take the basic histogram
     # app and use that as the basis
     # for positioning elements within
     # the app

# We can divide the UI layout
     # into a grid

# This involves fluidRow() for adding rows
# And column() for adding columns within rows

# Draw grid on board to talk about
     # rows and columns

# Row height of fluid rows is
     # determined by the elements in the row
     # https://stackoverflow.com/questions/25340847/control-the-height-in-fluidrow-in-r-shiny

# Column width is up to 12 (between 1 and 12)
# Offsets allow a column on right side of row

# Start by adding rows above output
     # with text to show the rows
# Then make columns
# Put slider and plot into 
     # the created grid spaces

# Add a wellPanel() around first grid space
     # Show how to format code with ctrl (cmd) + I

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     fluidRow(
          column(width = 3, 
                 wellPanel(
                      h2("First column"),
                      sliderInput(inputId = "num",
                                  label = "Choose a number",
                                  value = 25,
                                  min = 1,
                                  max = 100)
                 )
          ),
          column(width = 5,
                 h2("Second column")
          )
     ),
     fluidRow(
          column(width = 6, 
                 offset = 6,
                 h2("Last column, second row"),
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