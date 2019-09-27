# In the second in-class exercise
     # we'll take the basic histogram
     # app and use that as the basis
     # for positioning elements within
     # the app

# We can divide the UI layout
     # into a grid

# This involves fluidRow() for adding rows
# And column() for adding columns within rows

# Row height of fluid rows is
     # determined by the elements in the row
     # https://stackoverflow.com/questions/25340847/control-the-height-in-fluidrow-in-r-shiny

# Column width is up to 12 (between 1 and 12)

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     fluidRow(column(3, h2("First column"),
                     sliderInput(inputId = "num",
                                 label = "Choose a number",
                                 value = 25,
                                 min = 1,
                                 max = 100)
     ),
              column(5, h2("Second column") )
              ),
     fluidRow(
          column(6, offset = 6,
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