#' ---
#' title: "Name app"
#' author: Andrew Ladle
#' output: github_document
#' ---
#' 
ui <- fluidPage(
textInput("name", "What's your name?"),

textOutput("greeting")
)

server <- function(input,output, session){
  output$greeting <- renderText({
    paste0("Nice to meet you, ", input$name)
  })
}

shinyApp(ui, server)
