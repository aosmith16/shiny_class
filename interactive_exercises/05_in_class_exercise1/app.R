# The in-class exercise this week
     # is to demonstrate
     # the reactive() function

# This function is useful when we want to show
     # multiple reactive outputs based on
     # the same reactive input

# In this case this makes sure we 
     # aren't simulating new data for each function
     # but reactive() is often used
     # so we don't have a lot of repetititive
     # code doing the same task within 
     # each render*() function
     # (Which can lead to efficiency issues)


# The main change from the basic
     # histogram app we've used in the past
     # is that we want to add summary()
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
          # (Encourage students to do add
          # renderPrint()/verbatimTextOutput())
     
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
          # so don't name with output$
     # Instead it gives reactive output
          # we can use in other reactive functions
     samp = reactive({
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