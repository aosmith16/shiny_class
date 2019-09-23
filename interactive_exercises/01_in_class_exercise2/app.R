# In class exercise 2 is to start
     # with the most basic template
     # and then add an input function in the UI,
     # make output in the server,
     # and then put the plot in the UI

# The algorithm is from the
     # first Shiny video tutorial slides
     # https://www.dropbox.com/s/rjt6g3ctdqvihat/shiny-quickstart-1.zip?dl=0&file_subpath=%2Fdownloads%2F01-How-to-start.pdf

# The focus is on inputs and outputs
# We will not spend a lot of time talking
     # about the deep background,
     # as we will go into more depth
     # on each piece over the weeks

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     # Add slider
     sliderInput(inputId = "num",
                 label = "Choose a number",
                 value = 25,
                 min = 1,
                 max = 100),
     # Add plot output
     # This doesn't change look of app
          # but does make space for the plot
     plotOutput("hist")
)

# We'll add a reactive function that takes
     # the input into the server function

# Server function
server = function(input, output) {
     # In server we use inputs to make outputs
     # Outputs must be assigned names
     
     # Make objects to display using render*() functions
          # when passing in inputs
          # can also use for non-reactive output
     
     # output$hist = renderPlot({
     #  title = "100 random values from a normal distribution"
     #  hist( rnorm(100), main = title )    # non-reactive output
     # })
     
     # Pass in inputs by name; inputId important!
     output$hist = renderPlot({
      hist( rnorm( input$num) )    # Reactive output using input by name
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)