library(tidyverse)
snow_data <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Snow\\processed\\WTU_Snow_indicators.csv")
snow_data

snow_indicator <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Indicators\\indicators.csv")
snow_indicator

ggplot(snow_data, aes(x = Mean_annual_snow_persistence_WT
, y = snow_p
)) +
  geom_point() +
  labs(x = "Snow persistence (mm)", y = "Snow precipitation (days)")
cor(snow_data$Mean_annual_snow_persistence_WT,snow_data$snow_p)

snow_lm <- lm(Mean_annual_snow_persistence_WT ~ snow_p, data = snow_data)
summary(snow_lm)


ggplot(snow_data, aes(x = Mean_annual_snow_persistence_WT, y =snow_p )) +
  geom_point() +
  labs(x = "Snow precipitation (mm)", y = "Snow persistence (days)") +
  geom_smooth(method = "lm", se = FALSE)