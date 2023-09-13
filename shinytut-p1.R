#' ---
#' title: "Shiny tutorial: Part 1"
#' author: Andrew Ladle
#' output: github_document
#' ---

#' First step is to load the Shiny app
library(shiny)

#' Next create directory for the app - this should be in a standalone R script

ui <- fluidPage(
  "Hello, world!"
)

server <- function(input, output, session) {
}

shinyApp(ui, server)

#' I see that RStudio instantly recognises that a Shiny app is included and 
#' offers the "Run App" option
#' 
#' Now we make it more compelx and add UI
#' 
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session) {
}

shinyApp(ui, server)

#'  This has created a UI, which is a drop down menu showing a list of 
#'  dataset choices. Currently the outputs are not defined so not present
#'  
#'  Next step is to define the outputs in the server function
#'  
ui <- fluidPage(
  selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- function(input, output, session) {
  output$summary <- renderPrint({
    dataset <- get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- get(input$dataset, "package:datasets")
    dataset
  })
}

shinyApp(ui, server)

#' Done! Now we have a drop down menu with outputs either as a summary or as
#' a complete table