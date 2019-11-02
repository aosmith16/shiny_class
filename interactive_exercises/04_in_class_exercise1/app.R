# In the first exercise we will learn about
     # built in panels like the title panel
     # and the focus on the
     # the sidebar layout, a common general layout

# This starts with a minimal app

# Add title panel
# Add sidebarlayout with sidebar and main panel
# Move sidebar on right
# Add a slider to sidebar

# We will then focus on learning some of the HTML
     # tag functions for adding static content
     # with different formatting
# We cover: 
     # Block tags
          # headers (h1()-h6()), with and without centering
          # paragraphs (p()), changing font and colors
     # Inline formatting, 
          # adding emphasis with em() (italics)
          # This can be used within p(), headers, and as labels
          # The headers can also be used as label
     # Tags wtih attributes
          # links with a() (link to COF)
          # images with image() and www folder
     # Revisit line breaks with br()

# Add output (student activity) to main panel
     # Show this works same as
     # have so far by adding plotOutput("hist")
     # after making renderPlot() in server function

# Switch to app from written tutorial (app "html_tags_example")
     # to demonstrate more tags
     # without having to type all in real time

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel(title = "My Shiny App"),
     p("This is an",
       em("app,"),
       "made in Shiny.", 
       style = "color: blue"),
     p("It will show an interactive graphic.", 
       style = "color: purple; font-family: 'times'; font-size: 16pt"),
     sidebarLayout(
          # position = "right",
          sidebarPanel(
               # h1("Here is a slider"),
               h2("Here is a slider"),
               sliderInput(inputId = "num",
                           label = em("Slider"),
                           min = 1,
                           max = 50,
                           value = 25),
               br(),
               br(),
               br(),
               img(src = "OSU_logo.png", 
                   height = 64, 
                   width = 200),
               br(),
               br(),
               p("Link to", 
                 a("College of Forestry", 
                   href = "https://www.forestry.oregonstate.edu/") 
               )
          ),
          mainPanel(
               h1("First level", align = "center"),
               h2("Second level", align = "center"),
               h3("Third level", align = "center"),
               plotOutput(outputId = "hist") 
          )
     )
)

# We'll add a reactive function that takes
     # the input into the server function

# Server function
server = function(input, output) {
     output$hist = renderPlot({
          hist(rnorm(input$num), main = "" )
     })

}

# Create app object
shinyApp(ui = ui, server = server)