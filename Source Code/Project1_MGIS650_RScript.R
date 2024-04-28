options(scipen=999)
pacman::p_load(pacman, rio, tidyverse)

head(Cancer)

# Quick overview of each variable's quantile 
summary(Cancer)

###############################################Visualizing Using R####################################################3
# Data visualization of incidenceRate and countyCode
Cancer %>%
  select(incidenceRate:countyCode) %>%
  plot()

Cancer %>%
  select(recTrend:incidenceRate) %>%
  plot()

# Data visualization of incidenceRate and povertyPercent
ggplot(data=Cancer) +
  geom_line(mapping=aes(x=povertyPercent, y=incidenceRate, group = State, 
                        color=State), size = 1) +
  labs(y="Incidence Rate", x="Poverty Percent", title="Cancer by Poverty Percent") 

# Data visualization of PovertyEst
hist(Cancer$PovertyEst, breaks = 7, main = "Histogram of Poverty Estimate",
     ylab = "Frequency", xlab = "PovertyEst", col = "red")

# Data visualization of incidenceRate and medIncome
hist(Cancer$medIncome, breaks = 7, main = "Histogram of Median Income",
     ylab = "Frequency", xlab = "Median Income", col = "green")

# Data visualization of incidenceRate and popEst2015
hist(Cancer$popEst2015, breaks = 7, main = "Histogram of Estimated Population 2015",
     ylab = "Frequency", xlab = "Population 2015", col = "blue")

# Data visualization of incidenceRate and deathRate
bp <- ggplot(Cancer, aes(y=1, x="", fill=deathRate))+
  geom_bar(width = 1, stat = "identity")
bp

# Data visualization of incidenceRate and avgDeathsPerYear
bp <- ggplot(Cancer, aes(y=1, x="", fill=avgDeathsPerYear))+
  geom_bar(width = 1, stat = "identity")
bp

library(ggplot2)
# Barplot of the data by State and recent trend of deaths in each state
df = table(Cancer$recTrend, Cancer$State)
barplot(df, main="Cancer Distribution by State and recTrend",
        xlab="States", ylab="incidenceRate", col=c("darkblue","red","green","orange"),
        legend = rownames(df))

# Barplot of cancer incidence rates by state
g <- ggplot(Cancer, aes(State))
g + geom_bar()


########################################Performing linear regression##################################################

names(Cancer) #columns in this data set
dim(Cancer) #dimensions of the data set
colSums(is.na(Cancer)) #To check the missing values in each columns

#performing linear regression without the geographical variables.
lr = lm(incidenceRate ~ . - County - countyName - countyCode - State, data = Cancer)
#summary(lr)

#creating a null regression output to perform forward selection.
null= lm(incidenceRate ~ 1, data = Cancer)
#summary(null)

#Forward selection to find the optimized solution.
fwd_slc = step(null,scope=list(lower=null, upper=lr),direction="forward")
summary(fwd_slc)

#r-squared value is 0.4729. p-value is less than alpha therefore this model is overall significant.