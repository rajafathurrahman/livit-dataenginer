library(dplyr)
library(GGally) # for correlation viasualization
library(caret)# Package for machine learning algorithms / CARET stands for Classification And REgression Training

#load dataset
AllDt <- readRDS("AllDt.rds")

#turn categorical into numerical value
drv <-factor(AllDt$PlyPosition)
AllDt$PlyPositionNum <- as.numeric(drv)

drv1 <-factor(AllDt$HmAw)
AllDt$HmAwNum <- as.numeric(drv1)

##### Exploratory data analysis ####
# get correlation between variable
ggcorr(AllDt, method = c("everything", "pearson"))

x <- AllDt[,c('Date','HmAwNum','PlyPositionNum','Team.Possession','Minutes','WinProb','Crosses')]

#split into test and training dataset
TrainDate <- x$Date < "2020-12-01"
TrainDt <- x[TrainDate,]
TestDt <- x[!TrainDate,]

#drop variable 'date'
TrainDt <- TrainDt[,2:7]
TestDt <- TestDt[,2:7]
##### build model numeric prediction using randomforest methods

tuned_model <- train(Crosses ~ ., data = TrainDt,
                     ntree = 5, # number of trees (passed ot random forest)
                     method = "rf") # random forests

#display high recomended model
print(tuned_model)

#prediction teating data using best model
Model.testing <-predict(tuned_model$finalModel, TestDt)

#input result prediction into data test
TestDt$CrossPred <- round(Model.testing)

#print the RMSE (root mean square error)
TestDt$Resid <- round(TestDt$CrossPred - TestDt$Crosses,2)
RMSE <- sqrt(mean(TestDt$Resid ^ 2))
print(RMSE)

#print the MAE (mean absoulte error)
MAE <- mean(abs(TestDt$Resid))
print(MAE)
