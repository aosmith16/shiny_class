# This is for an in-class activity
# The base app is from the app we're starting with
     # for the interactive coding exercise

# Students will be asked to add
     # a second variable y, also with
     # a double-sided slider from 0-25

# Then they should make a scatterplot using
     # whatever package they like

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
                           max = 25)
          ),
          mainPanel(
               plotOutput("scatter")
          )
     )
)

# Server function
server = function(input, output) {
     data = reactive({
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