
ui <- fluidPage (
  titlePanel("Predicting Iris Species"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("SepalLength", label = "Sepal Length:", value = 5.8
                  , min = 4.3, max = 7.9, step = .1)
      ,sliderInput("SepalWidth", "Sepal Width:", value = 3
                   , min = 2.0, max = 4.4, step = .1)
      ,sliderInput("PetalLength", "Petal Length:", value = 4.3
                   , min = 1.0, max = 6.9, step = .1)
      ,sliderInput("PetalWidth", "Petal Width:", value = 1.3
                   , min = 0.1, max = 2.5, step = .1)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Prediction",DT::dataTableOutput("pred_table")),
      tabPanel("Scatter Plot", plotOutput("plot")),
      tabPanel("Sepal Length Density", plotOutput("SLDensity")),
      tabPanel("Sepal Width Density", plotOutput("SWDensity")),
      tabPanel("Petal Length Density", plotOutput("PLDensity")),
      tabPanel("Petal Width Density", plotOutput("PWDensity"))
    )
    )
  )
)


