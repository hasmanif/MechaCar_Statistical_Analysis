#Deliverable 1 ------------------------
library(dplyr)

mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

head(mpg_table)

#Perform linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table) 

#Perform linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table)) 

#Deliverable 2 ------------------------

coils <- read.csv(file='Suspension_coil.csv',check.names=F,stringsAsFactors = F)

head(coils)

#Create Total Summary Dataframe
total_summary <- coils %>% summarize(Mean=mean(PSI),Median=(PSI),Variance=var(PSI),SD=sd(PSI))

#Create a Lot Summary Dataframe
lot_summary <- coils %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

#Deliverable 3 -----------------------------------------------------------

#perform t-test to determine if the PSI across 
# Peform t-test across all Lots
t.test(coils$PSI,mu = 1500)
# Peform t-test on Lot 1
t.test(subset(coils,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)
# Peform t-test on Lot 2
t.test(subset(coils,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)
# Peform t-test on Lot 3
t.test(subset(coils,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)