# Bridgerland M&M Game
## This is a shiny app that lets students interact with the screen to build 
## graphs with M&M candies.

# Load the shiny library
library(shiny)
library(ggplot2)
source("functions.R")

# Define UI
ui <- fluidPage(
  titlePanel("M&M Colors"),
  sidebarLayout(position = "right",
    sidebarPanel(
      h2("Add an M&M", align = "center"),
      fluidRow(
        column(3,
               actionButton("subtract_brown", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Brown", align = "center")),
        column(3,
               actionButton("add_brown", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3,
               actionButton("subtract_blue", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Blue", align = "center")),
        column(3,
               actionButton("add_blue", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3,
               actionButton("subtract_red", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Red", align = "center")),
        column(3,
               actionButton("add_red", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3,
               actionButton("subtract_orange", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Orange", align = "center")),
        column(3,
               actionButton("add_orange", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3,
               actionButton("subtract_yellow", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Yellow", align = "center")),
        column(3,
               actionButton("add_yellow", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      fluidRow(
        column(3,
               actionButton("subtract_green", "", width = '100%', icon = icon("minus", lib = "font-awesome"))),
        column(5,
               h3("Green", align = "center")),
        column(3,
               actionButton("add_green", "", width = '100%', icon = icon("plus", lib = "font-awesome")))
      ),
      
      fluidRow(
        column(12,
               actionButton("reset", width = '100%', label = 'Reset'))
      )
    ),
    mainPanel(
      plotOutput("MnMPlot"),
      fluidRow(
        textOutput("count")
      )
    )
  )
)

# Define server logic
server <- function(input, output, session) {
  counter <- reactiveValues(
    brown_counter = 0, 
    blue_counter = 0,
    green_counter = 0,
    red_counter = 0,
    yellow_counter = 0,
    orange_counter = 0)
  
  observeEvent(input$add_brown, {
    counter$brown_counter <- counter$brown_counter + 1
  })
  observeEvent(input$add_blue, {
    counter$blue_counter <- counter$blue_counter + 1
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
  
  
  observeEvent(input$subtract_brown, {
    counter$brown_counter <- counter$brown_counter - 1
  })
  observeEvent(input$subtract_blue, {
    counter$blue_counter <- counter$blue_counter - 1
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
    counter$brown_counter <- 0
    counter$blue_counter <- 0
    counter$green_counter <- 0
    counter$yellow_counter <- 0
    counter$red_counter <- 0
    counter$orange_counter <- 0
  })
  
  output$MnMPlot <- renderPlot({
    mm_graph(br = counter$brown_counter,
             bl = counter$blue_counter,
             g = counter$green_counter,
             y = counter$yellow_counter,
             r = counter$red_counter,
             o = counter$orange_counter)
  })
  
  output$brown_count <- renderText({counter$brown_counter})
  output$blue_count <- renderText({counter$blue_counter})
  output$green_count <- renderText({counter$green_counter})
  output$red_count <- renderText({counter$red_counter})
  output$yellow_count <- renderText({counter$yellow_counter})
  output$orange_count <- renderText({counter$orange_counter})
}

# Run the app
shinyApp(ui, server)
