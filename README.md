# Introduction to Shiny

This repository contains the files used in an Introduction to Shiny reading and conference class I will teach in Fall 2019 (2019-09-30 to 2019-12-04).  The class meets for a total of eight 2-hour sessions, with the last session reserved for students to show off their own apps.

Materials for class session are in separate folders for each meeting.  These contain app templates that were the basis for interactive coding, handouts, and pictures of apps for students to recreate.

Apps with the code we worked on interactively together are in a folder named "interactive_exercises", mostly to help me remember what I wanted to cover.  Apps that students were to recreate on their own are stored in "assignment_solutions".

# Outline

Here is the basic outline of what I will cover:

## Class 1

1. Introduction  
     * Student introductions  
     * Syllabus with basic topics, final project, participation  
     * Materials for each class  
2. Structure of an app  
     * Go through example apps with runExample() - handout  
     * Interactive coding - make first app by copying "01_hello"  
     * In class assignment - students make minor changes to app code (change title, plot look)  
3. Build a basic app  
     * Start with minimal app template  
     * Interactive coding - add reactive input, reactive function, reactive output (histogram example)  
     
## Class 2

1. Continue basic app as needed
2. Reactive inputs (control widgets) - handout
     * Start with minimal app template  
     * Interactive coding – explore numericInput(), helpTextInput(), sliderInput(), selectInput()  
     * Run app "all_input_functions" to see all input functions  
3. In class assignment - students recreate app shown in image “shiny_class_2_recreate_app.PNG”

## Class 3

1. Render*() functions and reactive outputs - handout
     * Start with histogram app template we made in first week  
     * Interactive coding - render functions (renderPlot(), renderPrint(), renderText(), renderTable() )  
2. In class assignment - students recreate app shown in image “shiny_class_3_recreate_app.PNG”
3. Reading data into app  
     * Interactive coding - data within app folder  

## Class 4

1. Deploying app  
     * Run code in R from online or GitHub  
     * shinapps.io  
     * Shiny server  
2. Sidebar layout - interactive coding (titlePanel(), sidebarPanel() )  
3. HTML tags to control user interface - handout  
     * Interactive coding to demonstrate (p(), em(), h1(), h2(), img() )  
     * Run “html_tags_example” app to show more HTML tags  
4. In class assignment - students recreate app shown in image “shiny_class_4_recreate_app.PNG”  
5. Grid layout - interactive coding (fluidRow(), column() )  

## Class 5

1. In class assignment - students recreate app shown in image “shiny_class_5_recreate_app.PNG”  
2. The reactive() function to build dataset for use in render*() functions – interactive coding  

## Class 6

1. In class assignment - fix errors in five example apps
2. Add interactivity to a scatterplot - interactive coding
     * Can put source code in app folder
     * Read in data from app folder
     * Add click/hover/brush to plotOutput()
     * Make tables in server(), add tableOutput() to UI
     * As time allows, show adding an “All” option to selectInput() and a conditional in reactive()

## Class 7

1. In class assignment - add second variable to app to recreate “shiny_class_7_recreate_app.PNG”
2. Action buttons to delay reaction - interactive coding
     * Replace reactive() with eventReactive()
     * Mention observeReactive() and reactiveValues()
3. More built-in panel layouts - handout
     * Focus on tabs, show example "06_tabsets"
     * Show navlistPanel example: https://shiny.rstudio.com/gallery/navlistpanel-example.html
