#' ---
#' title: "Name app"
#' author: Andrew Ladle
#' output: github_document
#' ---
#' 
ui <- fluidPage(
textInput("name", "What's your name?"),
actionButton('enter_proxy', "Enter"),
textOutput("greeting")
)

server <- function(input,output, session){
  enteredText <- eventReactive(input$enter_proxy, {
    input$name
  })
  output$greeting <- renderText({
    paste0("Nice to meet you, ", enteredText())
  })
}

shinyApp(ui, server)

#' Now im going to try adding a key press function by editing the textInput 
#' function (see the onKeyPress line which is new)
# pkgload::load_all()
# textInput <- function(inputId, label, value = "", width = NULL,
#                       placeholder = NULL) {
#   
#   value <- restoreInput(id = inputId, default = value)
#   
#   div(class = "form-group shiny-input-container",
#       style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
#       label %AND% tags$label(label, `for` = inputId),
#       tags$input(
#         id = inputId, 
#         type="text", 
#         class="form-control", 
#         value=value,
#         placeholder = placeholder, 
#         onKeyPress = sprintf("Shiny.setInputValue('%s_keypress', event.key)", inputId)
#       )
#   )
# }
# library(shiny)
# 
# ui <- function(request){
#   tagList(
#     textInput("name","What's your name?"),
#     br(),
#     textOutput("greeting")
#   )
#   
# }
# 
# server <- function(input, output, session){
#   enteredText <- eventReactive(input$enter_proxy, {
#     input$name
#   })
#   observeEvent(input$name_keypress, {
#     print(input$name_keypress)
#     if (input$name_keypress == "Enter"){
#       output$greeting <- renderText({
#         paste0("Nice to meet you, ", enteredText())
#       })
#     }
#   })
#   
# }
# 
# shinyApp(ui, server)