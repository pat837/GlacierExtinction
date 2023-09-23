data <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Domestic_Water_Gap_monthly.csv")

dim(data)
print(data)

#create a column domestic
data$domesticw <-ifelse(data$Water_gap_total>=0.1 & data$Water_gap_total<=0.9,"Domestic use","no domestic use")
data


write.csv(data,"C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Domestic_Water_Gap_monthly.csv",row.names=FALSE)


data_industry <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Industrial_Water_Gap_monthly.csv")
data_industry


dim(data_industry)
data_industry

data_industry$industrialuse <- ifelse(data_industry$Water_gap_total>=0.1 & data_industry$Water_gap_total<=0.9,"Industrial use","unfit for industrial usage")
data_industry

write.csv(data_industry,"C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Industrial_Water_Gap_monthly.csv",row.names = FALSE)

data_irr <- read.csv("C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Irrigation_Water_Gap_monthly.csv")
data_irr

data_irr$irrigation <-ifelse(data_irr$Water_gap_total>=0.1 & data_irr$Water_gap_total<=0.9,"can be used for irrigation","cannot be used for irrigation")
data_irr
write.csv(data_irr,"C:\\Users\\srinivas\\Desktop\\dsrcsv\\WTU_Irrigation_Water_Gap_monthly.csv",row.names = FALSE)