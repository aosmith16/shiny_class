# The in-class exercise this week
     # is to demonstrate
     # the reactive() function

# This can be used when we want to show
     # multiple reactive outputs based on
     # the same reactive input

# This makes sure we aren't simulating new data
     # each time in this case but is often used
     # so we don't have a lot of repetititive
     # code doing a task in each render*() function
     # (Which can be an efficiency issue)

# The main change from the basic
     # histogram app is that we want to add summary()
     # output for the distribution, done
     # with renderText() and verbatimTextOutput()

# Demonstrate in the Console how random numbers
     # change when we make a new draw
     # (this can be fixed with set.seed()
          # but the goal here is to demonstrate reactive() )

# Load package shiny
library(shiny)

# Can add seed here to show that first
     # way doesn't return correct result for summary()
     # but reactive way does
set.seed(16)

# User interface
ui = fluidPage(
     sliderInput(inputId = "num",
                 label = "Choose a number",
                 value = 25,
                 min = 1,
                 max = 100),
     plotOutput("hist"),
     verbatimTextOutput("sum")
)

# Server function
server = function(input, output) {
     # Start with 2 sep render*() functions that
          # take a different random sample each time
     # output$hist = renderPlot({
     #      hist( rnorm(input$num) )
     # })
     # 
     # output$sum = renderPrint({
     #      summary( rnorm(input$num) )
     # })
     
     # Use reactive() function to draw the random
          # sample one time
     # This is not output to use in output functions
          # so don't name with output$
     samp = reactive({
          rnorm(input$num)
     })
     # Use samp() in the render functions
          # (call it like a function)
     output$hist = renderPlot({
          hist( samp() )
     })

     output$sum = renderPrint({
          summary( samp() )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)