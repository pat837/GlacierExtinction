install.packages("glmnet")
library(glmnet)
library(readr)
install.packages("caret")

snow_data <- read_csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Snow\\processed\\WTU_Snow_indicators.csv")

library(caret)
set.seed(123)
index <- createDataPartition(snow_data$Mean_annual_snow_persistence_WT, p = 0.7, list = FALSE)
training <- snow_data[index,]
training
testing <- snow_data[-index,]
testing

x <- as.matrix(training[, -1])
x

 y<- training$Mean_annual_snow_persistence_WT
 fit <- glmnet(x, y, alpha = 1, lambda = 0.1)
 fit
 summary(fit)
 
 
 x_test <- as.matrix(testing[, -1])
 y_test <- testing$Mean_annual_snow_persistence_WT
 
 y_pred <- predict(fit, newx = x_test)
 y_pred
 summary(y_pred)
 
 
 MSE <- mean((y_test - y_pred)^2)
 MSE
 R_squared <- cor(y_test, y_pred)^2
 R_squared
 
 #plot(fit, xvar = "lambda", label = TRUE)
 plot(y_test, y_pred, xvar = "lambda", label = TRUE)
 warnings()
