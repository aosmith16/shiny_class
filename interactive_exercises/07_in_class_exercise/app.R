# Students finished creating our
     # starter app by adding the y variable
     # and plot

# Once that was done the focus can switch
     # to action buttons to delay
     # re-plotting until all reactive values
     # are selected

# Action buttons are used with 
     # observeEvent() to trigger commands,
     # eventReactive() to delay reactions,
     # and reactiveValues() to update and call programatically
# We will focus on eventReactive() 

# Delaying reactions can be much more efficient
     # and can make the the output feel
     # cleaner for the user

# This is most apparent when there are several
     # reactive values that all are used in
     # the same reactive output

# Article on action buttons: 
     # http://shiny.rstudio.com/articles/action-buttons.html

# Start by adding basic action button

# Load all packages
library(shiny)
library(ggplot2)

# User interface
ui = fluidPage(
     titlePanel("Simulate two variables"),
     sidebarLayout(
          sidebarPanel(
               sliderInput(inputId = "num",
                           label = "Choose number values to draw:",
                           value = 25,
                           min = 10,
                           max = 100),
               helpText(
                    em("The x and y variables are drawn from
                    a random uniform distribution.
                    Choose the minimum and maximum
                    of the distribution for each variable
                    using the double-sided slider.") 
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
               # First just do click
               # Then add in width of 100% to go across sidebar
               actionButton(inputId = "click",
                            label = "Update plot",
                            width = "100%")
          ),
          mainPanel(
               plotOutput("scatter")
          )
     )
)

# Server function
server = function(input, output) {

     # Change reactive statement to eventReactive()
     # Use input$click to avoid updating plot
          # until button clicked
     data = eventReactive(input$click, {
          x = runif(n = input$num, 
                    min = input$x[1], 
                    max = input$x[2])
          # Draw y variable
          y = runif(n = input$num, 
                    min = input$y[1], 
                    max = input$y[2])
          data.frame(x, y)
     })
     
     output$scatter = renderPlot({
          ggplot(data = data(), aes(x, y) ) +
               geom_point(size = 3) +
               theme_bw(base_size = 18)
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)