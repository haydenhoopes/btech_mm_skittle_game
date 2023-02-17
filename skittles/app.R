# Bridgerland Skittle Game
## This is a shiny app that lets students interact with the screen to build 
## graphs with Skittles candies.

# Load the shiny library
library(shiny)
library(ggplot2)
source("functions.R")

# Define UI
ui <- fluidPage(
  tags$style(
    HTML('
         #buttons {
         height:60px; z-index:5;
         display: flex;
         align-items: center;
         justify-content: center;
         }
         h1, h2, h3, .h1, .h2, .h3 {
         margin-top:10px;
         margin-bottom:10px;
         }
         ')
  ),
  titlePanel("Skittles Colors"),
  sidebarLayout(position = "right",
    sidebarPanel(
      h2("Add a Skittle", align = "center"),
      fluidRow(
        column(3, id="buttons",
               actionButton("subtract_orange", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5, id="buttons",
               h3("Orange", align = "center")),
        column(3, id="buttons",
               actionButton("add_orange", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3, id="buttons",
               actionButton("subtract_yellow", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5, id="buttons",
               h3("Yellow", align = "center")),
        column(3, id="buttons",
               actionButton("add_yellow", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3, id="buttons",
               actionButton("subtract_green", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5, id="buttons",
               h3("Green", align = "center")),
        column(3, id="buttons",
               actionButton("add_green", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3, id="buttons",
               actionButton("subtract_purple", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5, id="buttons",
               h3("Purple", align = "center")),
        column(3, id="buttons",
               actionButton("add_purple", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3, id="buttons",
               actionButton("subtract_red", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5, id="buttons",
               h3("Red", align = "center")),
        column(3, id="buttons",
               actionButton("add_red", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(12,
               actionButton("reset", width = '100%', label = 'Reset'))
      )
    ),
    mainPanel(
      plotOutput("SkittlePlot")
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  counter <- reactiveValues(
    purple_counter = 0,
    green_counter = 0,
    red_counter = 0,
    yellow_counter = 0,
    orange_counter = 0)
  
  observeEvent(input$add_purple, {
    counter$purple_counter <- counter$purple_counter + 1
  })
  observeEvent(input$add_green, {
    counter$green_counter <- counter$green_counter + 1
  })
  observeEvent(input$add_red, {
    counter$red_counter <- counter$red_counter + 1
  })
  observeEvent(input$add_yellow, {
    counter$yellow_counter <- counter$yellow_counter + 1
  })
  observeEvent(input$add_orange, {
    counter$orange_counter <- counter$orange_counter + 1
  })
  
  observeEvent(input$subtract_purple, {
    counter$purple_counter <- counter$purple_counter - 1
  })
  observeEvent(input$subtract_green, {
    counter$green_counter <- counter$green_counter - 1
  })
  observeEvent(input$subtract_red, {
    counter$red_counter <- counter$red_counter - 1
  })
  observeEvent(input$subtract_yellow, {
    counter$yellow_counter <- counter$yellow_counter - 1
  })
  observeEvent(input$subtract_orange, {
    counter$orange_counter <- counter$orange_counter - 1
  })
  
  
  observeEvent(input$reset, {
    counter$purple_counter <- 0
    counter$green_counter <- 0
    counter$yellow_counter <- 0
    counter$red_counter <- 0
    counter$orange_counter <- 0
  })
  
  output$SkittlePlot <- renderPlot({
    skittles_graph(
             p = counter$purple_counter,
             g = counter$green_counter,
             y = counter$yellow_counter,
             r = counter$red_counter,
             o = counter$orange_counter)
  })
  
  output$purple_count <- renderText({counter$purple_counter})
  output$green_count <- renderText({counter$green_counter})
  output$red_count <- renderText({counter$red_counter})
  output$yellow_count <- renderText({counter$yellow_counter})
  output$orange_count <- renderText({counter$orange_counter})
}

# Run the app
shinyApp(ui, server)
