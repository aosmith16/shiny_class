# Today the focus is on practicing reactive()
     # as well as what it looks like to 
     # 1. Subset a dataset for plotting
     # 2. Use a select widget to choose the subset group
     # 3. Practice if() statement by adding an "All" group
          # to the choices

# Also talk about having additional scripts
     # in the app directory, which can
     # be run using source()

# The starting app has code for reading the data
     # and the select input function

# Originally this app was for interactive graphs
# See articles for info on these:
     # https://shiny.rstudio.com/articles/plot-interaction.html
     # https://shiny.rstudio.com/articles/selecting-rows-of-data.html

# Load packages
library(shiny)
# Add additional packages to load outside of ui/server
library(ggplot2) # plotting
library(dplyr) # data manip

# Read data
dat = read.csv("scatter_dat.csv")

# We will talk about input selection 
     # for plotting subsets
# User interface
ui = fluidPage(
     titlePanel("Choosing groups to plot"),
     sidebarLayout(
          sidebarPanel(
               # Start with three groups to choose from (A, B, C)
               # Add "All" group
               selectInput(inputId = "pick",
                           label = "Choose a group to plot:",
                           choices = c("All",
                                       "A" = "a",
                                       "B" = "b",
                                       "C" = "c"),
                           selected = "All")
          ),
          # The output is a scatterplot
          # Will also show dataset as DataTable
          mainPanel(
               plotOutput(outputId = "scatter"),
               dataTableOutput(outputId = "outdat")
          )
     )
)
     
# Server function
server = function(input, output) {
     
     # Subset the dataset in a reactive() function
     # Show if() statement for "All" choice
          # so either use whole dataset or filter if not "All"
     data = reactive({
          # Looks like need return() here to get whole dataset
          if(input$pick == "All") {
               return(dat)
          }
          
          filter(dat, group == input$pick)
          
     })
     
     # Before plotting show how dataset changes
          # as we select different groups
     # Have students practice using data() 
          # from reactive with renderDataTable()
     
     # If get warning message about the data table,
          # the current htmltools (0.4) leads to this
          # downgrade or use DT versions of functions directly 
               # (i.e., DT::renderDataTable and DT::dataTableOutput)
          # See https://github.com/rstudio/shiny/issues/2653
     output$outdat = renderDataTable({
          data()
     })
     
     # Make a scatterplot based on selected data
          # as the main output
     # Using ggplot() so students can see an example
          # but could use base R plot here
     output$scatter = renderPlot({
          ggplot(data = data(), aes(x = xvar, y = yvar) ) +
               geom_point() +
               theme_bw(base_size = 16)
     })

}

# Create app object
shinyApp(ui = ui, server = server)