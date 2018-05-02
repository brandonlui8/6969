library(xgboost)
library(tidyverse)
library(DT)


IrisSpecies <- xgb.load("iris.model")
load("IrisSpeciesInfo.rda")


generatePreds <- function(Sepal.Length = 6, Sepal.Width = 3, Petal.Length = 4, Petal.Width = 1){
  
  testDF <- data.frame(
    SepalLength = Sepal.Length, SepalWidth = Sepal.Width, PetalLength = Petal.Length, PetalWidth = Petal.Width
  )
  
  preds <- predict(IrisSpecies, as.matrix(testDF))
  
  data.frame(
    Species = IrisSpeciesInfo$var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
  
}