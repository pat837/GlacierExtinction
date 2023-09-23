install.packages("tidyverse")
library(tidyverse)

snow_data <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Snow\\processed\\WTU_Snow_indicators.csv")
snow_data

snow_indicator <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrproject\\data_ngs_watertowers\\Indicators\\indicators.csv")
snow_indicator
summary(snow_indicator)
str(snow_indicator)

snow_indicator$snow_pinches<- (snow_indicator$snow_p)/25.4
snow_indicator$snow_pinches

snow_indicator$rain_p <-(snow_indicator$snow_p)/10
snow_indicator$rain_p

snow_indicator$rain_pinches <-(snow_indicator$rain_p)/25.4
snow_indicator$rain_pinches

ggplot(snow_data,aes(x=Var_interannual_snow_persistence_WT,Var_intraannual_snow_persistence_WT))+ geom_point()+ labs(x="snow persistence(inter-annually)",y = "snow persistence(intra-annualy)")

cor(snow_data$Var_interannual_snow_persistence_WT,snow_data$Var_intraannual_snow_persistence_WT)

linear_model <-lm(snow_data$Var_interannual_snow_persistence_WT ~ snow_data$Var_intraannual_snow_persistence_WT)
summary(linear_model)

ggplot(snow_data,aes(x=Var_interannual_snow_persistence_WT,y=Var_intraannual_snow_persistence_WT))+
  geom_smooth(method = "lm",se = FALSE)
#



summary(linear_model)








