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