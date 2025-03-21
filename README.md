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

I checked for the Sub Saharan African countries with the highest prevalence rate of HIV which shows that Eswatini is topping the list with 28%. It seems that the HIV prevalence rate for non Sub Saharan countries such as Morocco, Libya, Egypt, and Algeria were not captured. (See the figure below)

<img width="459" alt="image" src="https://github.com/user-attachments/assets/77816930-c289-4129-8caf-b63de3ff7dd6" />

## Descriptive Statistics: 
Using R studio, I installed certain packages including: “foreign”, “tidyverse”, ”pastecs”, “psych”, “ggplot2”, “corrplot”, and “coefplot”; loaded the corresponding libraries and ran the summary of descriptive statistics which provided mean, median, variation, standard deviation, minimum, maximum, skewness, and kurtosis values of all the variables at a glance. I went ahead to plot histograms to understand the data distribution which showed that some columns were skewed. Applying the Shapiro Wilk test for normality on variables such as HIV_15_19 and literacy shows p-values of 5e-10 and 2e-07 respectively; <0.05 hence we can assume that the data is not normally distributed. 

## Model: 
I used correlation matrix to check the relationships between the variables, however most of the variables seem not to be correlated except for urban and rural populations which are strongly inversely correlated with a value of -0.77. Contrarily, literacy is weakly correlated to life expectancy with 0.23

<img width="459" alt="image" src="https://github.com/user-attachments/assets/efef30ef-5ce1-4236-9ddd-b36d87f2b32e" />

A simple regression model is used to estimate the cause-effect relationship between a dependent variable, HIV prevalence and an independent variable, population growth. Later a multiple linear regression model is also used to check the combined causal effects of literacy and population growth on HIV prevalence among the adult population. However, there are certain assumptions that need to hold before using a linear regression model and these include: 
Linearity (linear relationship) between the dependent and independent variables.
Homoscedasticity (constant variance of errors called residuals) across all the independent variables.
Normality (normal distribution of error).
No multicollinearity (no high correlation) between the independent variables.
Plotting correlations with confidence intervals for HIV prevalence and population growth shows that there is no relationship between them with correlation coefficient, R of -0.2 and p-value of 0.15  
<img width="459" alt="image" src="https://github.com/user-attachments/assets/24beb5d2-ab31-4723-9d34-81f463898af6" />

Likewise life_expectancy and literacy with correlation coefficient, R of 0.2 and p-value of 0.095. 
<img width="459" alt="image" src="https://github.com/user-attachments/assets/2ba55d52-478b-4106-af29-b6007d30a883" />

<img width="459" alt="image" src="https://github.com/user-attachments/assets/a3b8c205-e192-436d-8df0-8a76b8c2ad41" />

## Conclusion: 
Based on the available data, the information generated is not robust enough to conclude that the level of literacy seems not to affect the prevalence of HIV among the adult population; hence the need for further studies.

