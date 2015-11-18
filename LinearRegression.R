library(caret)


## reference 
##http://topepo.github.io/caret/Linear_Regression.html
GetSimpleLinearRegressionModel <- function(data){
  trainControl <- trainControl(method="cv")
  train(Solubility~.,data, method="lm",trControl = trainControl)
}

GetForwardSelectionLinearRegressionModel <- function(data){
  trainControl <- trainControl(method="cv")
  train(Solubility~.,data, method="leapForward",trControl = trainControl,tuneGrid = expand.grid(nvmax  = 1:20))
}

GetPartialLeastSqare<- function(data){
  trainControl <- trainControl(method="cv")
  ##number of components is the tuning parameter for PLS
  train(Solubility~.,data, method="pls",trControl = trainControl, tuneGrid = expand.grid(ncomp = 1:20))
}

GetPrincipalComponenRegression<- function(data){
  trainControl <- trainControl(method="cv")
  ##number of components is the tuning parameter for PLS
  train(Solubility~.,data, method="pcr",trControl = trainControl, tuneGrid = expand.grid(ncomp = 1:35))
}


GetLasso<- function(data){
  trainControl <- trainControl(method="cv")
  ##Fraction of full solution is the tuning parameter
  train(Solubility~.,data, method="lasso",trControl = trainControl, tuneGrid = expand.grid(fraction  = seq(0,1,0.1)))
}