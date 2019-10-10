# We are starting with the week 2 input app
     # and then adding
     # different render*() functions and
     # output functions

# Start by showing how we can use
     # renderText() and
     # textOutput() to see what an
     # input result looks like

# Discuss renderPlot() and plotOuput() again

# Show an error, using
     # reactive values outside of a reactive function

# Introduce new functions
     # 1. Will use renderText/textOutput to show
          # output of input reactive value
     # 2. Show verbatim text output of a summary
     # 3. Show table output, showing multiple lines
          # within a render function and table/DataTable

# End with renderPlot()/plotOutput()
     # which we saw in week 1

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     
     numericInput(inputId = "num",
                  label = "Enter number",
                  value = 6,
                  min = 0,
                  max = 10,
                  step = 2),
     
     helpText("Select one or more groups",
              br(),
              "from the drop-down menu below."),

     selectInput(inputId = "choose",
                 label = "Select options below",
                 choices = c("Yes" = "yes",
                             "No" = "no",
                             "Maybe" = "other"),
                 multiple = TRUE),

     sliderInput(inputId = "slide",
                 label = "Choose minmum and maximum value",
                 value = c(10, 20),
                 min = 0,
                 max = 50,
                 step = 0.01),
     
     # Paired with renderText()
     textOutput(outputId = "text"),
     
     # Paired with renderText()/renderPrint()
     # verbatimTextOutput(outputId = "sum"),
     
     # Paired with renderTable()/renderDataTable()
     # tableOutput(outputId = "table"),
     dataTableOutput(outputId = "table"),
     
     # Paired with renderPlot()
     plotOutput(outputId = "hist")
     
)

# Server function
server = function(input, output) {
     # Show how to render text to display
          # what input is
     # Then use paste() function to create
          # output statements
     output$text = renderText({
          # input$num
          # input$choose
          # input$slide
          # paste("The input number is:", input$num)
          paste("You chose a minimum of", input$slide[1], 
                "and a maximum of", imput$slide[2])
     })
     
     # Show error when not using render*() functions
     # output$text = input$num
     
     # Use renderPrint() to capture all printed input,
          # needed to get names of summary()
     # output$sum = renderPrint({
     #      summary( rnorm(input$num) )
     # })
     
     # Example of table/interactive table to be
          # paired with tableOutput/dataTableOutput
     # Demonstrates using multiple lines
          # within a reactive function (which is why the curly braces)
     output$table = renderDataTable({
          norm = rnorm(input$num)
          dat = data.frame(norm)
          head(dat)
     })

     # Here is a histogram like week 1
     output$hist = renderPlot({
          hist( rnorm(input$num) )
     })

}

# Create app object
shinyApp(ui = ui, server = server)