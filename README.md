# R project - Analysis of the African World Development Indicators data 
Relationship between literacy rate and HIV prevalence
## Objectives:
To understand how literacy rate affects the prevalence of HIV among the adult population. 
## Mission:
- Identifies gaps and major concerns with the data and the methodology behind the data collection, as well as affirms quality methodological approaches
- Presents descriptive statistics. 
- Explains decisions about an appropriate model(s).
- Present model results in an engaging way.
- Interprets the results in substantive terms
## Gaps: 
The data frame has 54 observations and 33 variables with various missing data points and blanks represented as NA and dots respectively. I am not sure of the methodology used in collecting this data, however, during data entry, the data type for antiretroviral therapy coverage (% of people living with HIV) was coded as “string” instead of “numeric”. Using the R studio data analysis software, I tried changing the column to numeric using “as.numeric” but it did not respond to the command, not sure what the problem was. Then I replaced “NA”s using zero. I checked for duplicates using “sum(duplicated()” command and there are no duplicates. I decided to work with 54 observations and 10 variables to test the hypothesis that literacy rate will likely affect the HIV prevalence among the adult population from 15-49 years. I looked at the variables such as life_expectancy, literacy, HIV_15_49, antiretroviral_HIV, population, urbanpop, ruralpop, and pop_growth.
## Descriptive Statistics: 
Using R studio, I installed certain packages including: “foreign”, “tidyverse”, ”pastecs”, “psych”, “ggplot2”, “corrplot”, and “coefplot”; loaded the corresponding libraries and ran the summary of descriptive statistics which provided mean, median, variation, standard deviation, minimum, maximum, skewness, and kurtosis values of all the variables at a glance. I went ahead to plot histograms to understand the data distribution which showed that some columns were skewed. Applying the Shapiro Wilk test for normality on variables such as HIV_15_19 and literacy shows p-values of 5e-10 and 2e-07 respectively; <0.05 hence we can assume that the data is not normally distributed. 
## Model: 
I used correlation coefficients to check the relationships between the variables, however most of the variables seem not to be correlated except for urban and rural populations which are strongly inversely correlated with a value of -0.77. Contrarily, literacy is weakly correlated to life expectancy with 0.23
A simple regression model is used to estimate the linear relationship between a dependent variable, HIV prevalence and an independent variable, population growth. Later a multiple linear regression model is also used to check the combined causal effects of literacy and population growth on HIV prevalence among the adult population. However, there are certain assumptions that need to hold before using a linear regression model and these include: 
Linearity (linear relationship) between the dependent and independent variables.
Homoscedasticity (constant variance of errors called residuals) across all the independent variables.
Normality (normal distribution of error).
No multicollinearity (no high correlation) between the independent variables.
Plotting correlations with confidence intervals for HIV prevalence and population growth shows that there is no relationship between them with correlation coefficient, R of -0.2 and p-value of 0.15  likewise life_expectancy and literacy with correlation coefficient, R of 0.2 and p-value of 0.095. 
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

## Conclusion: 
Based on the available data, the information generated is not robust enough to conclude that the level of literacy seems not to affect the prevalence of HIV among the adult population; hence the need for further studies.

