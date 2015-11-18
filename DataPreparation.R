library(AppliedPredictiveModeling)
data(solubility)



Train <- solTrainX 
Train$Solubility <- solTrainY

Test <- solTestX
Test$Solubility <- solTestY

getTrainData <- function() Train
getTestData <- function() Test