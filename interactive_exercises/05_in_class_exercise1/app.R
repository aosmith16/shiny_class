# The first in-class exercise this week
     # is to demonstrate
     # the reactive() function

# This function is useful when we want to show
     # multiple reactive outputs based on
     # the same reactive input

# In this case this makes sure we 
     # aren't simulating new data for each output
     # we are making
     # but reactive() is often useful
     # so we don't have a lot of repetititive
     # code doing the same task within 
     # multiple render*() functions
     # (Which can lead to efficiency issues)

# The main change from the basic
     # histogram app we've used in the past
     # is that we now want to add summary()
     # output for the distribution, done
     # with renderPrint() and verbatimTextOutput()

# Demonstrate in the Console how random numbers
     # change when we make a new draw
     # (this can be addressed with set.seed()
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
     plotOutput(outputId = "hist"),
     # Add verbatimTextOutput() for summary()
     verbatimTextOutput(outputId = "sum")
)

# Server function
server = function(input, output) {
     # Add summary() with renderPrint()
          # (Students attempt to add
          # renderPrint()/verbatimTextOutput()
          # as an exercise before we do as a class)
     
     # Start with 2 sep render*() functions that
          # take a different random sample each time
     # output$hist = renderPlot({
     #      hist( n = rnorm(input$num) )
     # })
     # 
     # output$sum = renderPrint({
     #      summary( n = rnorm(input$num) )
     # })
     
     # Use reactive() function to draw the random
          # sample one time
     # We are not using this as output for the UI
          # so don't to name it with output$
     # Instead we get reactive output
          # to use in other reactive functions
          # within the server
     
     # In a last step, add a seed into reactive()
          # to show students are actually getting the 
          # output from the same distribution
          # compared to making summary/hist outside of shiny
     samp = reactive({
          set.seed(16) # Add this last to demonstrate results are from same vector
          rnorm(n = input$num)
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