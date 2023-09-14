#' ---
#' title: "Multiply by 5 (or another number!)"
#' author: Andrew Ladle
#' output: github_document
#' ---
#' 

#' Here we create a sliding app that allows you to slide between number 
#' 1 and 50 and multiply by 5

library(shiny)

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  "then x times 5 is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({ 
    input$x * 5
  })
}

shinyApp(ui, server)

#' Next step is to add another slider to change the multiplier

ui <- fluidPage(
  sliderInput("x", label = "If x is", min = 1, max = 50, value = 30),
  sliderInput("y", label = "and y is", min = 1, max = 50, value = 5),
  "then x times y is",
  textOutput("product")
)

server <- function(input, output, session) {
  output$product <- renderText({ 
    input$x * input$y
  })
}

shinyApp(ui, server)

#' WAHOOOOOOO!