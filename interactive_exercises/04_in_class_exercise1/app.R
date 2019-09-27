# In the first exercise we will learn about
     # basic panels like the title panel
     # and the focus on the
     # the sidebar layout, a common first (and general) layout

# This starts with a minimal app

# Move sidebar on right
# Add a slider to sidebar

# We will then focus on learning some of the HTML
     # tag functions for adding static content
     # with different formatting
# We cover: 
     # headers (h1()-h6()), with centering
     # paragraphs (p()), 
          # including adding emphasis and
          # changing font and colors
     # links with a() (link to COF)
     # images with image() and www folder
     # revisit br()

# Show that add output functions as
     # have so far by adding plotOutput("hist")
     # (even though no output in this)

# Switch to app from writen tutorial ("html_tags_example")
     # to demonstarte more tags
     # without having to type all in real time

# Load package shiny
library(shiny)

# User interface
ui = fluidPage(
     titlePanel("My Shiny App"),
     p("This is an",
       em("app, "),
       "made in Shiny.", 
       style = "color: blue"),
     p("It will show an interactive graphic.", style = "font-family: 'times'; color: purple"),
     sidebarLayout(
          # position = "right",
          sidebarPanel(
               # h1("Input slider"),
               h2("Here is a slider"),
               sliderInput(inputId = "num",
                           label = "Slider",
                           min = 1,
                           max = 50,
                           value = 25),
               br(),
               br(),
               br(),
               img(src = "OSU_logo.png", height = 64, width = 200),
               br(),
               p("Link to ", 
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

}

# Create app object
shinyApp(ui = ui, server = server)