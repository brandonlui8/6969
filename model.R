library(xgboost)
library(tidyverse)

iris <- iris

y1 <- iris$Species
var.levels <- levels(y1)
y = as.integer(y1) - 1 

x = iris[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length', 'Petal.Width')]
var.names <- names(x)
x <- as.matrix(x)

params <- list(
  "objective" = "multi:softprob"
  , "eval_metric" = "mlogloss"
  ,"num_class" = length(table(y))
  ,"eta" = .05
  , "max_depth" = 3
)

## Tweak # of rounds and eta to find log loss that bottoms out 
cv.nround = 250    ## No. of rounds to run Tweak to find good log loss

bst.cv <- xgb.cv(param = params, data = x, label = y 
                 , nfold = 5, nrounds = cv.nround
                 , missing = NA, prediction = TRUE)    ##Create cross-validation & save predictions

nrounds <- which.min(bst.cv$evaluation_log$test_mlogloss_mean)
bst.cv$evaluation_log[nrounds,]

IrisSpecies <- xgboost(param = params, data = x, label = y
                        , nrounds = nrounds, missing = NA)



xgb.save(IrisSpecies, "iris.model")


IrisSpeciesInfo <- list(
  var.names = var.names
  , var.levels = var.levels
)

save(IrisSpeciesInfo, file = 'IrisSpeciesInfo.rda')



xgb.importance(var.names, model = IrisSpecies)

generatePreds <- function(Sepal.Length = 6, Sepal.Width = 3, Petal.Length = 4, Petal.Width = 1){
  
  testDF <- as.matrix(
    depth, table, price, x , y
  )
  
  preds <- predict(DiamondClass, as.matrix(testDF))
  
  data.frame(
    Cut = var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
  
}

scatter + geom_point(aes(color=Species, shape=Species)) +
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")

ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))
