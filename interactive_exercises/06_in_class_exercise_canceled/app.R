# Today the focus is on interactive plots,
     # hovering, clicking, brushing

# But we'll also take time to talk about
     # what it looks like to subset
     # a dataset for plotting

# The app to start has code for reading the data
     # and the select input function

# If there is time, show adding an "All" group
     # and then making an if statement

# See articles for more advanced work:
     # https://shiny.rstudio.com/articles/plot-interaction.html
     # https://shiny.rstudio.com/articles/selecting-rows-of-data.html

# Load packages
library(shiny)
library(ggplot2) # plotting
library(dplyr) # data manip

# Read data
dat = read.csv("scatter_dat.csv")

# We will talk about input selection 
     # for plotting subsets

# The main focus of this app is on "tooltips" 
     # for interactive plots
     # (hover, click, brush)

# User interface
ui = fluidPage(
     titlePanel("Interactive plots"),
     sidebarLayout(
          sidebarPanel(
               # As time allows, add an "All" choice
               selectInput(inputId = "pick",
                           label = "Choose a group to plot:",
                           choices = c("All",
                                       "A" = "a",
                                       "B" = "b",
                                       "C" = "c"),
                           selected = "All")
               ),
          # Start with plot_click
          # This can be added and we get something to click
               # with but nothing happens because we haven't defined 
               # the data we want yet
          # In additon to plot_click we have
               # plot_hover, plot_dblclick, plot_brush
          # Demonstrate plot_brush, as well
               mainPanel(
                    plotOutput("scatter",
                               click = "plot_click",
                               brush = "plot_brush"),
                    # Put output of click below plot
                    # verbatimTextOutput("plot_clickinfo")
                    tableOutput(outputId = "plot_clickinfo"),
                    tableOutput(outputId = "plot_brushinfo")
               )
          )
)
     
# Server function
server = function(input, output) {
     
     # Subset the dataset in a reactive() function
     # As time allows, show if() statement for "All" choice
          # so either use whole dataset or filter if not "All"
     data = reactive({
          # Looks like need return() here to get whole dataset
          if(input$pick == "All") {
               return(dat)
          }
          
          filter(dat, group == input$pick)
          
     })
     
     # Make the plot from the data
     output$scatter = renderPlot({
          ggplot(data(), aes(x = xvar, y = yvar) ) +
               geom_point() +
               theme_bw(base_size = 16)
     })
     
     # Making basic info to display on a click
     # output$plot_clickinfo = renderPrint({
     #      input$plot_click
     # })
     # Maybe want a table instead of text
     output$plot_clickinfo = renderTable({
          data.frame(x = input$plot_click$x,
                     y = input$plot_click$y)
     })
     
     # Comment out click and show brush
     # Demonstrate basic brush output using brushedPoints
     output$plot_brushinfo = renderTable({
          brushedPoints(data(), brush = input$plot_brush)
     })
     # End by uncommenting out clicks so have brush and click
}

# Create app object
shinyApp(ui = ui, server = server)