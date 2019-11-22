# Students finished creating the basis of the app
     # by adding the y variable
     # and a scatterplot of x vs y 
     # (using whatever plotting package they like)

# Once that was done the focus switched
     # to action buttons to delay
     # plotting until all 5 reactive values
     # are selected

# Action buttons are used with 
     # observeEvent() to trigger commands,
     # eventReactive() to delay reactions,
     # and reactiveValues() to update and call programatically
# We will focus on eventReactive() 

# Delaying reactions can be much more efficient
     # and can make the app feel
     # cleaner (less busy) for the user

# This is most apparent when there are several
     # reactive values that all are used in
     # the same reactive output

# Article on action buttons: 
     # http://shiny.rstudio.com/articles/action-buttons.html

# Start by adding basic action button
     # at bottom of sidebar

# Load all packages
library(shiny)
library(ggplot2)

# User interface
ui = fluidPage(
     titlePanel("Simulate two variables"),
     sidebarLayout(
          sidebarPanel(
               sliderInput(inputId = "num",
                           label = "Choose number of values to draw:",
                           value = 25,
                           min = 10,
                           max = 100),
               helpText(
                    em("The x and y variables are simulated
                    via random draws from the uniform distribution.
                    Choose the minimum and maximum value
                    of the distribution for each variable
                    using the double-sided sliders below.") 
                    ),
               sliderInput(inputId = "x",
                           label = "Choose limits for the x variable:",
                           value = c(0, 10),
                           min = 0,
                           max = 25),
               # Add in the second slider
               sliderInput(inputId = "y",
                           label = "Choose limits for the y variable:",
                           value = c(0, 10),
                           min = 0,
                           max = 25),
               # First just do click button with inputId and label
               # Then add in width of 100% to go across entire sidebar
               actionButton(inputId = "click",
                            label = "Update plot",
                            width = "100%")
          ),
          mainPanel(
               plotOutput(outputId = "scatter")
          )
     )
)

# Server function
server = function(input, output) {

     # Change reactive statement to eventReactive()
     # Use input$click as the eventExpr 
          # to avoid updating plot
          # until the action button is clicked
     # The second argument is the expression
          # to call when the button is clicked
          # and is surrounded by curly braces
     data = eventReactive(eventExpr = input$click, {
          x = runif(n = input$num, 
                    min = input$x[1], 
                    max = input$x[2])
          # Draw y variable
          y = runif(n = input$num, 
                    min = input$y[1], 
                    max = input$y[2])
          data.frame(x, y)
     }
     )
     
     output$scatter = renderPlot({
          ggplot(data = data(), aes(x = x, y = y) ) +
               geom_point(size = 3) +
               theme_bw(base_size = 18)
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)