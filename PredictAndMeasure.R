predictAndMeasure = function(model,model.label,trainingData,ytrain,testData,ytest,tm , grid = NULL,verbose=F) {
  pred = predict(model , trainingData) 
  RMSE.train = RMSE(obs = ytrain , pred = pred)
  
  pred = predict(model , testData) 
  RMSE.test = RMSE(obs = ytest , pred = pred)
  
  if (verbose) cat("****** RMSE(train) =",RMSE.train," -  RMSE(test) =",RMSE.test,"  --  Time elapsed(sec.):",tm[[3]], "...  \n")
  
  perf.grid = NULL
  if (is.null(grid)) { 
    perf.grid = data.frame(predictor = c(model.label) , RMSE.train = c(RMSE.train) , RMSE.test = c(RMSE.test) , time = c(tm[[3]]))
  } else {
    .grid = data.frame(predictor = c(model.label) , RMSE.train = c(RMSE.train) , RMSE.test = c(RMSE.test) , time = c(tm[[3]]))
    perf.grid = rbind(grid, .grid)
  }
  
  perf.grid
}