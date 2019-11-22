# Introduction to Shiny

This repository contains the files used in an Introduction to Shiny reading and conference class I will teach in Fall 2019 (2019-09-30 to 2019-12-04).  The class meets for a total of eight 2-hour sessions, with the last session reserved for students to show off their own apps.

Materials for class session are in separate folders for each meeting.  These contain app templates that were the basis for interactive coding, handouts, and pictures of apps for students to recreate.

Apps with the code we worked on interactively together are in a folder named "interactive_exercises", mostly to help me remember what I wanted to cover.  Apps that students were to recreate on their own are stored in "activity_solutions".

# Outline

Here is the basic outline of what I will cover:

## Class 1

1. Introduction  
     * Student introductions  
     * Syllabus with basic topics, final project, participation  
     * Materials for each class  
2. Structure of an app  
     * Go through example apps 01_hello, 03_reactivity, 04_mpg, 06_tabsets, and 10_download with runExample() (**handout 1**)  
     * Create first app: interactive coding 
          * Set working directory  
          * Make folder for app in that directory  
          * Copy code from "01_hello" into new script  
          * Save that script as app.R into app folder  
          * runApp() function or Run App button  
     * **In class activity**: students make minor changes to app code (change title, max slider #, plot line color)  
3. Build a basic app  
     * Start with minimal app template  
     * Add reactive input, reactive function, reactive output (histogram example): interactive coding  
     
## Class 2

1. Continue basic app as needed
2. Reactive inputs (control widgets) (**handout 2**)
     * Start with minimal app template  
     * Explore numericInput(), helpTextInput(), sliderInput(), selectInput(): interactive coding  
     * Run app "all_input_functions" to see all input functions  
3. **In class activity**: students recreate app shown in image “shiny_class_2_recreate_app.PNG”
4. Sharing an app (if time allows)
     * Run code in R from online or GitHub  
     * https://www.shinyapps.io  
     * Shiny server

## Class 3

1. Render\*() functions and reactive outputs (**handout 3**)
     * Start with histogram app template we made in first week  
     * Render functions (renderPlot(), renderPrint(), renderText(), renderTable() ): interactive coding  
2. **In class activity**: students recreate app shown in image “shiny_class_3_recreate_app.PNG”
3. Reading data into app  
     * Data within app folder: interactive coding  
4. Sharing an app (if time allows and haven't covered yet)  
     * Run code in R from online or GitHub  
     * https://www.shinyapps.io  
     * Shiny server

## Class 4

1. Sharing an app (if haven't covered yet)
     * Run code in R from online or GitHub  
     * https://www.shinyapps.io  
     * Shiny server  
2. Sidebar layout (titlePanel(), sidebarPanel() ): interactive coding   
3. HTML tags to control user interface (**handout 4**)  
     * Demonstrate tags (p(), em(), h1(), h2(), img() ): interactive coding  
     * Run “html_tags_example” app to show more HTML tags  
4. **In class activity**: students recreate app shown in image “shiny_class_4_recreate_app.PNG”  
5. If time: grid layout (fluidRow(), column(), wellPanel() ): interactive coding   
     * Mention shinydashboard package for dashboard templates

## Class 5

1. **In class activity**: fix errors in five example apps  
2. The reactive() function to build dataset for use in render*() functions: interactive coding  
3. Making a scatterplot for separate groups: interactive coding
     * Review of selectInput()
     * Filtering dataset in reactive()
     * Add *All* option along with if() statement in reactive()

## Class 6 original - canceled

*Canceled this class due to Veteran's Day holiday; moved some materials to other days*
1. Add interactivity to a scatterplot: interactive coding
     * Can put source code in app folder
     * Read in data from app folder
     * Add click/hover/brush to plotOutput()
     * Make tables in server(), add tableOutput() to UI

## Class 6

1. **In class activity**: add second variable to app to recreate “shiny_class_6_recreate_app.PNG”
2. Action buttons to delay reaction: interactive coding
     * Replace reactive() with eventReactive()
     * Mention observeEvent() and reactiveValues()
4. More built-in panel layouts (**handout 5**)
     * Focus on tabs, show example "06_tabsets"
     * Show navlistPanel() example: https://shiny.rstudio.com/gallery/navlistpanel-example.html
