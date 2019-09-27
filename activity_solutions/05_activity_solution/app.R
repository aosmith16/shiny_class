# This week students will build an app
     # based on info covered in the first four weeks

# The basic input/output is from the
     # rnorm() histogram that we've been using
     # for several weeks

# Students will put this into a 
     # sidebarLayout() with a title panel
     # and then add an input for putting
     # a title on the histogram
     # Students can go on to add this
     # new reactive value into the plotOutput()
     # code but they may have questions on this part
     # if they don't know the hist() function

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("Example histogram app"),
     sidebarLayout(
          sidebarPanel(
               textInput(inputId = "title",
                         label = "Write a title for the histogram",
                         value = "Very interesting data"),
               sliderInput(inputId = "num",
                           label = "Choose a number of samples",
                           value = 25,
                           min = 1,
                           max = 100)
               ),
          mainPanel(
               plotOutput(outputId = "hist")
               )
          )
     )

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist( rnorm(input$num), main = input$title )
     })
     
}

# Create app object
shinyApp(ui = ui, server = server)