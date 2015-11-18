library(Hmisc)

source("DataPreparation.R")

Train <- getTrainData()
describeRes <- describe(Train)
