# Here is an app to show
     # that data can be read from 
     # within app folder

# Load package shiny
library(shiny)

# Read in dataset from same directory
# dat = read.csv("scatter_dat.csv")

# Can also store in "data" folder within
     # app directory for organization reasons
dat = read.csv("data/scatter_dat.csv")

# User interface
ui = fluidPage(
     # After show static table,
          # add numericInput() to choose
          # number of rows to show
     # Can use nrow(dat) as maximum
     numericInput(inputId = "num",
                  label = "How many rows should show?",
                  value = 6,
                  min = 0,
                  max = nrow(dat) ),

     # Add tableOutput to show data as output
     tableOutput(outputId = "dat")
)

# Server function
server = function(input, output) {
     # Use renderTable to show first 6 lines
     # Add numericInput n = input$num
     # Add if statement to deal with blank
          # numericInput() (which is NA)
     output$dat = renderTable({
          # head(dat)
          if(is.na(input$num) ) {
               return()
          } else {
               head(dat, n = input$num)
          }
          })
     # Ask students how to figure out
          # what the output of numericInput
          # is when no value is filled in 
          # (use renderText()/textOutput())
     
}

# Create app object
shinyApp(ui = ui, server = server)