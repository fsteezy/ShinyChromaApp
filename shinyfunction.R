library(shiny)
library(chRoma)

# Create a vector database and add data to it
db <- create_collection()
vectors <- list(c(1.2, 2.3, 4.5), c(6.7, 8.2, 9.2))
metadata <- list(
  list(text = "This is a document", file = "source1"),
  list(text = "This is another document", file = "source2")
)
db <- add_collection(db, vectors, metadata)

ui <- fluidPage(
  titlePanel("chRoma Analysis App"),
  sidebarLayout(
    sidebarPanel(
      textInput("vector_input", "Enter vector (comma-separated):"),
      actionButton("analyze_button", "Analyze"),
    ),
    mainPanel(
      h4("Results:"),
      verbatimTextOutput("analysis_result")
    )
  )
)

server <- function(input, output) {
  observeEvent(input$analyze_button, {
    # Get the user input and convert it to a numeric vector
    input_vector <- as.numeric(unlist(strsplit(input$vector_input, ",")))
    
    # Check if the input is a valid numeric vector
    if (!any(is.na(input_vector))) {
      # Perform the analysis using the chRoma package
      result <- query_collection(db, query_embeddings = input_vector, top_n = 1)
      
      # Display the result
      output$analysis_result <- renderPrint({
        result
      })
    } else {
      # Display an error message if the input is not valid
      output$analysis_result <- renderText({
        "Invalid input. Please enter a comma-separated numeric vector."
      })
    }
  })
}

shinyApp(ui = ui, server = server)
