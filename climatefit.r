# Load necessary packages
library(tidyverse)
library(stats4)

# Read in data
snow_data <- read_csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Snow\\processed\\WTU_Snow_indicators.csv")

subset_data <- snow_data[,c("Var_interannual_snow_persistence_WT", "Var_intraannual_snow_persistence_WT")]
subset_data

install.packages("MASS")
library(MASS)


fit<-fitdistr(snow_data$Var_interannual_snow_persistence_WT, "gamma")
print(fit1)
#fitdistr(snow_data$Var_intraannual_snow_persistence_WT, "gamma")
shape <- fit$estimate["shape"]
rate <- fit$estimate["rate"]

loglik <- function(theta, x) {
  shape <- theta[1]
  rate <- theta[2]
  -sum(dgamma(x, shape, rate, log = TRUE))
}

start <- c(shape, rate)
mle <- optim(start, loglik, x = data$Var_interannual_snow_persistence_WT, method = "BFGS")
