##Install Package to Load Different Types of Datasets##
install.packages("foreign")

##Load Necessary Packages##
library(foreign)


##Load the Dataset##
wbdata <- read.csv(file.choose (), header=TRUE)

##View Dataset##
View(wbdata)

head(wbdata)
str(wbdata$antiretroviral_HIV)
as.numeric(wbdata$antiretroviral_HIV)
wbdata[is.na(wbdata$antiretroviral_HIV)]=0
#Finding missing data
is.na(wbdata)
#count missing data
sum(is.na(wbdata))
#replace missing data with zero
wbdata$food_insecurity = ifelse(is.na(wbdata$food_insecurity), ave (wbdata$food_insecurity, FUN = function(x)
                            mean(x,na.rm = TRUE)), wbdata$food_insecurity)
View (wbdata)

#check the structure
str(wbdata)
#Variable types
class(wbdata$country)
#Check for uniqueness
unique(wbdata$country)
#Check rows and columns
dim(wbdata)
#Rows with missing data
wbdata[!complete.cases(wbdata), ]
newdata <- wbdata[!complete.cases(wbdata), ]
#omit missing data
newdata <- na.omit(wbdata)
#Replace NA values with 0 using is.na()
wbdata[is.na(wbdata)]=0
head(wbdata)
#Check for duplicates
sum(duplicated(wbdata$country))
dim(wbdata[duplicated(wbdata$country)])
#Filter columns
#keep <-c("country","life_expectancy", "literacy", "HIV_15_49", "antiretroviral_HIV*","population", "urbanpop", "ruralpop", "subsaharan")
#df = wbdata[keep]

df=wbdata[,(names(wbdata)%in%
           c("country","life_expectancy", "literacy", "HIV_15_49", "antiretroviral_HIV","population", "pop_growth","urbanpop", "ruralpop","subsaharan"))]
View(df)

str(df)
df[is.na(df)]=0
as.numeric(df2$antiretroviral_HIV)
sapply

#test normality for literacy and HIV_15_49 using Shapiro Wilk test
?shapiro.test
shapiro.test(df$HIV_15_49)
shapiro.test(df$literacy)
#To convert literacy to percentage (%)
literacy_percent <- df$literacy

##Install Packages to Create Descriptive Statistics Tables##
install.packages("pastecs") 
install.packages("psych")

##Load Necessary Packages##
library(pastecs)
library(psych)
#summarize df
describe(df)

##Using R Functions##
describe(wbdata, na.rm=TRUE)
summary(wbdata)
#summary statistics of the new dataframe, df
describe(df)
mean(wbdata$antiretroviral_HIV, na.rm = TRUE) #Mean
var(wbdata$literacy, na.rm = TRUE) #Variance
sd(wbdata$literacy, na.rm = TRUE) #Standard deviation
min(wbdata$literacy, na.rm = TRUE) #Minimum
max(wbdata$literacy, na.rm = TRUE) #Maximum
range(wbdata$literacy, na.rm = TRUE) #Range
median(wbdata$literacy, na.rm = TRUE) #Median
quantile(wbdata$literacy, na.rm = TRUE) #Quantile
IQR(wbdata$literacy, na.rm = TRUE) #Inter-quantile range (25% to 75% - middle 50%)
summary(wbdata$literacy, na.rm = TRUE) #Mean, median, quantiles, range together

##Install Packages for graphs##
install.packages("ggplot2") 
install.packages("ggpubr")
install.packages("stargazer") 
install.packages("coefplot")
install.packages("lattice") 

##Load the packages##
library(ggplot2)
library(ggpubr)
library(stargazer)
library(coefplot)
library(lattice)

##Histogram Visualization##
#Literacy
hist(wbdata$literacy)
#Add different bin sizes
hist(wbdata$literacy, breaks = 10) 
#Add figure labels
hist(wbdata$literacy, main = "Literacy Frequency", xlab = "Literacy", ylab = "Frequency") 
#Add colors to the bar
hist(wbdata$literacy, main = "Literacy Frequency", xlab = "Literacy", ylab = "Frequency", col = "blue", border = FALSE) 

#Prevalence rate HIV 15-49
hist(wbdata$HIV_15_49)
#Add different bin sizes
hist(wbdata$HIV_15_49, breaks = 10) 
#Add figure labels
hist(wbdata$HIV_15_49, main = "HIV_15_49 Frequency", xlab = "HIV_15_49", ylab = "Frequency") 
#Add colors to the bar
hist(wbdata$HIV_15_49, main = "HIV_15_49 Frequency", xlab = "HIV_15_49", ylab = "Frequency", col = "darkgreen", border = TRUE) 

#To plot group histogram
install.packages("Hmisc")
#load Hmisc
library(Hmisc)

df2=df[,(names(df)%in%
              c("life_expectancy", "literacy", "HIV_15_49", "antiretroviral_HIV*","population", "urbanpop", "ruralpop","pop_growth"))]
View(df2)
str(df2)
as.numeric(df2$population)
df2[is.na(df2)]=0
View(df2)

#hist(df2)

##Kernal Density Plot##
plot(density(df2$Column2))

#Horizontal bar chart
ggplot(df, aes (y=value, x = country)) + 
  geom_bar(position="stack", stat="identity")

##Scatterplot Visualization##
install.packages("tidyverse") #tidyverse masks psych, pastecs, stats
library(tidyverse)
#attach(df)
 #plot(HIV_15_49, literacy, main="Scatterplot",
  #   xlab ="HIV prevalence 15-49", ylab= "Literacy", pch=19)

plot(df$pop_growth, df$HIV_15_49, main = "pop_growth v. HIV prevalence", xlab = "Population Growth", ylab = "HIV prevalence")
#text(df$pop_growth, df$HIV_15_49, labels=df$country) #Add marker labels
 
#scatterplot for literacy vs HIV prevalence 
df[is.na(df)]=0
ggplot(df, aes(x=literacy, y=HIV_15_49,color)) + geom_point() 

#scatterplot for countries vs HIV prevalence
ggplot(df, aes(x=country, y=HIV_15_49, col=subsaharan, horiz=TRUE )) + geom_point() + coord_flip()
#+ geom_text(aes(label=country)) #Ggplot
?ggplot

#Barplot
ggplot(df,aes(x=name, y=value))+ geom_bar()
?barplot
#columns sums using colSums(df)
#or using apply fundction
#apply(df,
#     FUN = sum,
#     MARGIN = 2)
#Find percentage using dplyr package
#library(dplyr)
#Group by 'group' and calculate the percentage within each group
#data <- df(
#  group=c("life_expectancy", "literacy", "HIV_15_49", "antiretroviral_HIV*","population", "urbanpop", "ruralpop")
#  value= )
#result<-data%<%
#  group_by(group)%<%
#  mutate(percentage = value/ sum(value)*100)
#print (result)

### Correlations and Correlation Tests ###

cor(df$pop_growth, df$HIV_15_49, method = "pearson", use = "complete.obs") #Pearson correlation coefficient
cor.test(df$pop_growth, df$HIV_15_49, method = "pearson", use = "complete.obs") #Pearson correlation test

cor(df$life_expectancy, df$literacy, method = "spearman", use = "complete.obs") #Pearson correlation coefficient
cor.test(df$life_expectancy, df$literacy, method = "spearman", use = "complete.obs") #Pearson correlation test

cor(df$life_expectancy, df$literacy, method = "pearson", use = "complete.obs") #Pearson correlation coefficient
cor.test(df$life_expectancy, df$literacy, method = "pearson", use = "complete.obs") #Pearson correlation test

cor.test(df$antiretroviral_HIV , df$antiretroviral_HIV , method = "pearson", use = "complete.obs") #Pearson correlation test

str(df)

#remove column, country
df1=subset(df,select=-c(country))
df1
#Corelation matrix
install.packages("corrplot")
library(corrplot)
#vusualization of correlation
corrplot(cor(df2),type="upper",method = "number",tl.col = "black", order="original")
??correlation

#plotting correlogram
##Install Packages to Create Descriptive Statistics Tables##
install.packages("pastecs") 
install.packages("psych")
##Load Necessary Packages##
library(pastecs)
library(psych)
pairs.panels(df2)

##Ploting Correlations with Confidence Interval using ggpubr Package
ggscatter(df, x = "pop_growth", y = "HIV_15_49", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "pop_growth", ylab = "HIV Prevalence")

ggscatter(df, x = "literacy", y = "life_expectancy", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "literacy", ylab = "life_expectancy")



### Linear Regression ###
mod1 <- lm(df$HIV_15_49 ~ df$pop_growth)
summary(mod1)

mod2 <- lm(df$life_expectancy ~ df$literacy)
summary(mod2)

mod3 <- lm(df$HIV_15_49 ~ df$pop_growth + df$literacy)
summary(mod3)

### Visual Regression Results ###

mod <- lm(df$HIV_15_49 ~ pop_growth + literacy, data = df) 

install.packages("coefplot") #Must be connected to the internet
library(coefplot)

coefplot(mod, intercept=TRUE, sort=c("natural"), decreasing=TRUE, title=""
         , newNames = c(pop_growth = "population growth", literacy = "literacy")
         , predictors = c("population growth", "literacy")
         , pointSize=4, color="blue", lwdInner=1, lwdOuter=1, zeroColor="red")




