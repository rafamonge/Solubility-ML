## Interesting post using the same data. Must check :)
##https://rpubs.com/Isaac/caret_reg

library(caret)
library(ggplot2)
library(dplyr)

set.seed(100)
source("DataPreparation.R")
source("LinearRegression.R")
source("PredictAndMeasure.R")


Train <- getTrainData()
Test <- getTestData()

## Linear regression and variants

simpleLm <- GetSimpleLinearRegressionModel(Train)
leapForward <- GetForwardSelectionLinearRegressionModel(Train)
pls <- GetPartialLeastSqare(Train)
pcr <- GetPrincipalComponenRegression(Train)
lasso <- GetLasso(Train)



## shows plot for the tuning parameter
plot(pcr, metric = "RMSE", plotType = "line")
plot(pls, metric = "RMSE", plotType = "line")
plot(lasso, metric = "RMSE", plotType = "line")



verbose = F 
ptm <- proc.time()
tm = proc.time() - ptm
perfGrid <- predictAndMeasure(simpleLm, "SimpleLm", Train, Train$Solubility, Test, Test$Solubility, tm,grid=NULL, verbose)
tm = proc.time() - ptm
perfGrid <- predictAndMeasure(leapForward, "leapForward", Train, Train$Solubility, Test, Test$Solubility, tm,grid=perfGrid, verbose)
tm = proc.time() - ptm
perfGrid <- predictAndMeasure(pls, "pls", Train, Train$Solubility, Test, Test$Solubility, tm,grid=perfGrid, verbose)
tm = proc.time() - ptm
perfGrid <- predictAndMeasure(pcr, "pcr", Train, Train$Solubility, Test, Test$Solubility, tm,grid=perfGrid, verbose)
tm = proc.time() - ptm
perfGrid <- predictAndMeasure(lasso, "lasso", Train, Train$Solubility, Test, Test$Solubility, tm,grid=perfGrid, verbose)
