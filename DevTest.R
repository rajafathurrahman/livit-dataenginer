rm(list = ls())
#Load packages
library(dplyr)

#Import Data
AllDt <- readRDS("AllDt.rds")

#Divide into Test and TrainDt - please leave this as is
TrainDate <- AllDt$Date < "2020-12-01"
TrainDt <- AllDt[TrainDate,]
TestDt <- AllDt[!TrainDate,]

#Devise methodology for predicitng Crosses in Test Data based on what's happened in Train Data
#For demonstration purposes, here is a crude methodology that just assumes the mean. Your solution should be better than this!
TestDt$CrossPred <- round(mean(TrainDt$Crosses),2)

#Use diagnostics to evaluate the performance of your predictions
#Here are some examples, you may want to use others
TestDt$Resid <- round(TestDt$CrossPred - TestDt$Crosses,2)
RMSE <- sqrt(mean(TestDt$Resid ^ 2))
print(RMSE)
MAE <- mean(abs(TestDt$Resid))
print(MAE)
