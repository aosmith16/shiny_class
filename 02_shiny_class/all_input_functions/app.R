# Shiny app to show many input functions
     # taken from https://shiny.rstudio.com/tutorial/written-tutorial/lesson3/

# Also see output from these input functions
     # in widget gallery: http://shiny.rstudio.com/gallery/widget-gallery.html

library(shiny)

# Define UI ----
ui <- fluidPage(
     titlePanel("Basic widgets"),
     
     fluidRow(
          
          column(3,
                 h3("Action Button"),
                 actionButton(inputId = "action", 
                              label = "Action")
          ),
          
          column(3,
                 h3("Single checkbox"),
                 checkboxInput(inputId = "checkbox", 
                               label = "Choice A", 
                               value = TRUE)
          ),
          
          column(3, 
                 checkboxGroupInput(inputId = "checkGroup", 
                                    label = h3("Checkbox group"), 
                                    choices = list("Choice 1" = 1, 
                                                   "Choice 2" = 2, 
                                                   "Choice 3" = 3),
                                    selected = 1)
          ),
          
          column(3, 
                 dateInput(inputId = "date", 
                           label = h3("Date input"), 
                           value = "2014-01-01")
          )   
     ),
     
     fluidRow(
          
          column(3,
                 dateRangeInput(inputId = "dates", 
                                label = h3("Date range"))
          ),
          
          column(3,
                 fileInput(inputId = "file", 
                           label = h3("File input"))
          ),
          
          column(3, 
                 h3("Help text"),
                 helpText("Note: help text isn't a true widget,", 
                          "but it provides an easy way to add text to",
                          "accompany other widgets.")
          ),
          
          column(3, 
                 numericInput(inputId = "num", 
                              label = h3("Numeric input"), 
                              value = 1)
          )   
     ),
     
     fluidRow(
          
          column(3,
                 radioButtons(inputId = "radio", 
                              label = h3("Radio buttons"),
                              choices = list("Choice 1" = 1, 
                                             "Choice 2" = 2,
                                             "Choice 3" = 3),
                              selected = 1)
          ),
          
          column(3,
                 h3("Select boxes"),
                 selectInput(inputId = "select", 
                             label = "Select one", 
                             choices = list("Choice 1" = 1, 
                                            "Choice 2" = 2,
                                            "Choice 3" = 3), 
                             selected = 1),
                 selectInput(inputId = "select2", 
                             label = "Select multiple", 
                             choices = list("Choice 1" = 1, 
                                            "Choice 2" = 2,
                                            "Choice 3" = 3), 
                             selected = 1,
                             multiple = TRUE)
          ),
          
          column(3, 
                 sliderInput(inputId = "slider1", 
                             label = h3("Sliders"),
                             min = 0, 
                             max = 100, 
                             value = 50),
                 sliderInput(inputId = "slider2", 
                             label = "",
                             min = 0, 
                             max = 100, 
                             value = c(25, 75))
          ),
          
          column(3, 
                 textInput(inputId = "text", 
                           label = h3("Text input"), 
                           value = "Enter text...")
          )   
     )
     
)

# Define server logic ----
server <- function(input, output) {
     
}

# Run the app ----
shinyApp(ui = ui, server = server)