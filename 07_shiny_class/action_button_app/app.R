# Start with app that chooses sample size
     # and min/max for x variable (between 0 and 25)
     # to be drawn from a random uniform

# Students will add a second variable y
     # also with a min/max between 0 and 25
     # to be drawn from a random uniform
     
# We will then practice action buttons  
     # for delaying reactions with eventReactive()

# Article on action buttons: 
     # http://shiny.rstudio.com/articles/action-buttons.html

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
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
          data.frame(x)
     })
     
     output$scatter = renderPlot({
          
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)