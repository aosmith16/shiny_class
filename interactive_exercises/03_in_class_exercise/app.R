# We are starting with the week 1 histogram app
     # and then adding
     # different render*() functions and
     # output functions

# The first step will be to show
     # that reactive values need reactive functions
     # or else there will be an error message

# Discuss renderPlot() and plotOuput() again
# Then show an error, using
     # reactive values outside of a reactive function
# Introduce new functions
     # 1. Will use renderText/textOutput to show
          # output of input reactive value
     # 2. Show verbatim text output of a summary
     # 3. Then table output, showing multiple lines
          # within a render function and table/DataTable

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
     # Paired with renderText()
     textOutput("text"),
     # Paired with renderPlot()
     # plotOutput("hist")
     # Paired with renderText()/renderPrint()
     # verbatimTextOutput("sum")
     dataTableOutput("table")
)

# Server function
server = function(input, output) {
     # Show how to render text, usually output
          # of a function, how to make
          # statements with paste() function
     output$text = renderText({
          # paste("The input number is:", input$num)
          paste("The number", input$num, "was the chosen number")
     })
     # Example of table/interactive table to be
          # paired with tableOutput/dataTableOutput
     output$table = renderDataTable({
          norm = rnorm(input$num)
          dat = data.frame(norm)
          head(dat)
     })
     # Use renderPrint() to capture all printed input,
          # needed to get names of summary()
     # output$sum = renderPrint({
     #      summary( rnorm(input$num) )
     # })
     # Start with the standard histogram we've been making
     # output$hist = renderPlot({
     #      hist( rnorm(input$num) )
     # })
     # Show error when not using render*() functions
     # output$hist = hist( rnorm(input$num) )
}

# Create app object
shinyApp(ui = ui, server = server)