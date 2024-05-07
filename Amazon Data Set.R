library(shiny)
library(plotly)
library(readr)

# Define UI
ui <- fluidPage(
  titlePanel("Amazon sales Dataset"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("generate_button", "Generate Charts")
    ),
    
    mainPanel(
      div(id = "charts_container",
          plotlyOutput("pie_chart"),
          plotlyOutput("bar_chart")),
      downloadButton("download_chart", "Download Charts")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Read the dataset
  data <- reactive({
    read.csv("D://MCA//R packages//Womens Fashion.csv")
  })
  
  # Function to generate pie chart
  generatePieChart <- eventReactive(input$generate_button, {
    category_data <- table(data()$ratings)
    # Custom color palette
    custom_colors <- c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b", "#e377c2", "#7f7f7f", "#bcbd22", "#17becf")
    pie_chart <- plot_ly(labels = names(category_data), values = category_data, type = "pie", textinfo = "percent+label", hole = 0.4, marker = list(colors = custom_colors))
    return(pie_chart)
  })
  
  # Function to generate bar chart
  generateBarChart <- eventReactive(input$generate_button, {
    category_data <- table(data()$ratings)
    bar_chart <- plot_ly(x = names(category_data), y = category_data, type = "bar", marker = list(color = "#1f77b4"))
    return(bar_chart)
  })
  
  # Render the pie chart
  output$pie_chart <- renderPlotly({
    generatePieChart()
  })
  
  # Render the bar chart
  output$bar_chart <- renderPlotly({
    generateBarChart()
  })
  
  # Allow user to download the charts as HTML
  output$download_chart <- downloadHandler(
    filename = function() {
      "charts.html"
    },
    content = function(file) {
      charts <- paste0(
        '<html>',
        '<head><title>Charts</title></head>',
        '<body>',
        '<div style="display: flex; justify-content: space-around;">',
        htmltools::html_print(generatePieChart()),
        htmltools::html_print(generateBarChart()),
        '</div>',
        '</body>',
        '</html>'
      )
      write(charts, file)
    }
  )
}

# Run the application
shinyApp(ui = ui, server = server)