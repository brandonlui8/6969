

server <- function(input, output){
  
  
  Preds <- reactive({
    generatePreds(
      Sepal.Length = input$SepalLength
      ,Sepal.Width = input$SepalWidth
      ,Petal.Length = input$PetalLength
      ,Petal.Width = input$PetalWidth
    )
  })
  
  output$pred_table <- DT::renderDataTable({
    Preds() %>%
      datatable() %>%
      formatPercentage(columns = 'preds', digits = 2)
  })
  
  output$plot <- renderPlot({
    scatter <- ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width)) 
    scatter + geom_point(aes(color=Species, shape=Species)) +
      xlab("Sepal Length") +  ylab("Sepal Width") +
      ggtitle("Sepal Length-Width") +
     geom_point(aes(x = input$SepalLength, y = input$SepalWidth),  color = 'red')
  })
  
  output$SWDensity <- renderPlot({
    density2 <- ggplot(data=iris, aes(x=Sepal.Width, fill=Species))
    density2 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Width") +  ylab("Density") + ggtitle("Histogram & Density Curve of Sepal Width") + 
      geom_vline(aes(xintercept= input$SepalWidth))
})
  
  output$SLDensity <- renderPlot({
    density2 <- ggplot(data=iris, aes(x=Sepal.Length, fill=Species))
    density2 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Sepal Length") +  ylab("Density") + ggtitle("Histogram & Density Curve of Sepal Length") +
      geom_vline(aes(xintercept= input$SepalLength))
  })
  
  output$PWDensity <- renderPlot({
    density2 <- ggplot(data=iris, aes(x=Petal.Width, fill=Species))
    density2 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Width") +  ylab("Density") + ggtitle("Histogram & Density Curve of Petal Width") +
      geom_vline(aes(xintercept= input$PetalWidth))
  })
  
  output$PLDensity <- renderPlot({
    density2 <- ggplot(data=iris, aes(x=Petal.Length, fill=Species))
    density2 + geom_density(stat="density", alpha=I(0.2)) +
      xlab("Petal Length") +  ylab("Density") + ggtitle("Histogram & Density Curve of Petal Length") +
      geom_vline(aes(xintercept= input$PetalLength))
  })
  
}




