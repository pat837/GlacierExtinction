# Load necessary packages
library(tidyverse)
library(stats4)

# Read in data
snow_data <- read_csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Snow\\processed\\WTU_Snow_indicators.csv")

# Define the log-likelihood function for linear regression
ll <- function(theta, x, y) {
  n<-length(y)
  beta0 <- theta[1]
  beta1 <- theta[2]
  sigma <- theta[3]
  -n/2*log(2*pi*sigma^2) - 1/(2*sigma^2)*sum((y - beta0 - beta1*x)^2)
  #log_lik <- sum(dnorm(y, mean = beta0 + beta1 * x, sd = sigma, log = TRUE))
  
  #return(-log_lik)
}


# Fit the MLE model
 mle_model<-mle(ll, start = list(theta=0.9,x=0.2,y=0.3),
                 data = list(x = snow_data$Var_interannual_snow_persistence_WT,
                             y = snow_data$Var_intraannual_snow_persistence_WT))

# View model summary
summary(mle_model)

# Extract estimated parameters
beta0 <- coef(mle_model)[1]
beta1 <- coef(mle_model)[2]
sigma <- coef(mle_model)[3]

# Plot regression line on scatterplot
ggplot(snow_data, aes(x = Var_interannual_snow_persistence_WT, y = Var_intraannual_snow_persistence_WT)) +
  geom_point() +
  labs(x = "Snow precipitation (mm)", y = "Snow persistence (days)") +
  geom_abline(intercept = beta0, slope = beta1)
