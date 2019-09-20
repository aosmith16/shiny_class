# Here is the app code
     # for the in-class activity
     # for practicing layouts and HTML tags

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("My Shiny App"),
     sidebarLayout(
          position = "right",
          sidebarPanel(
               h2("Background"),
               p("I made this practice Shiny app while I was a student at OSU"),
               br(),
               br(),
               img(src = "OSU_logo.png", height = 64, width = 200)
          ),
          mainPanel(
               h1("Introducing Shiny"),
               p("Shiny is a package from RStudio that makes it ", 
                 em("incredibly easy "), 
                 "to build interactive web applications with R."),
               p("For an introduction and live examples, visit the ",
                 a("Shiny homepage", 
                   href = "http://shiny.rstudio.com"),
                 "(http://shiny.rstudio.com).")
          )
     )
)

# We'll add a reactive function that takes
# the input into the server function

# Server function
server = function(input, output) {
     
}

# Create app object
shinyApp(ui = ui, server = server)