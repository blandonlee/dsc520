# Assignment Instructions

#   i. Fit a binary logistic regression model to the data set that predicts whether or not the patient survived for one year (the Risk1Y variable) 
#        after the surgery. Use the glm() function to perform the logistic regression. See Generalized Linear Models for an example. Include a 
#        summary using the summary() function in your results.

#   ii. According to the summary, which variables had the greatest effect on the survival rate?

#  iii. To compute the accuracy of your model, use the dataset to predict the outcome variable. The percent of correct predictions is the accuracy 
#        of your model. What is the accuracy of your model?

setwd('C:/Users/bland/Desktop')
install.packages("dplyr")
library(readr)
library(Rcmdr)
library(caret)
library(readxl)

# Imports Data
thoraric_surgery <- read.csv('csv_result-ThoraricSurgery.csv')
View(thoraric_surgery)
head(thoraric_surgery)

# Summary of Data
summary(thoraric_surgery)



# Fit a binary logistic regression model to the data set that predicts whether or not the patient survived for one year.
predict_survival <- with(thoraric_surgery, TumourSize >= 12 & Risk1Yr >= 1)
predict_survival

# glm() function to perform the logistic regression

Survive <- glm(predict_survival ~ Diagnosis+FVC+FEV1+Performance+PBF+HaemoptysisBS+DyspnoeaBS+CoughBS+WeaknessBS+TumourSize+Type2DM+
                 MI_6mo+ArterialDisease+Smoking+Asthma+Age.Surgery+Risk1Yr, data = thoraric_surgery, family = binomial(link = 'logit'))
# Summary of Regression
summary(Survive)

# In the summary function we see that the variables SmokingTRUE, HaemoptysisTRUE, and Diagnosis had the greatest negative effect while the 
# variables Age, AsthmaTRUE, MI_6moTRUE, Diabetes_MellitusTRUE, Tumor_Size, and FEV1 greatest possitive effect on the survival rate as seen 
# in the estimate.

# Compute the accuracy of your model

summary(thoraric_surgery)

deaths <- 470*0.1489
deaths

# Next we can calculate the amount of Risk1Y that was a 1 for died within a year. This is calculated by taking the 470 amount 
# of lines and multiply it by the mean 0.1489 which is seen as 470 * 0.1489 = 69.983. Which we see 70.

## While the predict_survival amount from our Patiet_Predicts_Survival shows 69 deaths as seen as the TRUE amount from our summary.
PredictNumber <- 69
PredictNumber

## Finally we will take the Patiet_Predicts_Survival_amount and divide by the data_set_deaths which will give us the percent of accuracy of the model.
accuracy <- PredictNumber/deaths
accuracy




# A. Fit a logistic regression model to the binary-classifier-data.csv dataset

# B. The dataset (found in binary-classifier-data.csv) contains three variables; label, x, and y. The label variable is either 0 or 1 and is 
#    the output we want to predict using the x and y variables.

#         i. What is the accuracy of the logistic regression classifier?

#        ii. Keep this assignment handy, as you will be comparing your results from this week to next week.



# Loading Data
library(readr)
binary_classifier_data <- read_csv("binary-classifier-data.csv")
view(binary_classifier_data)
head(binary_classifier_data)

# Fit a Logistic Regression Model

FitRegression <- with(binary_classifier_data, x >= 40 & y >= 55)
summary(FitRegression)

## I fit a logistic regression model to determine if the x variable is greater than or equal to 32 and  y variable 
## is greater than or equal to 45 which will show as true.


# glm() function to fit a logistic regression model

regression <- glm(FitRegression ~ label + x + y, data = binary_classifier_data, family = binomial())

# Summary
summary(regression)

# Accuracy of Regression
summary(binary_classifier_data)

## Compare the mean of labels to the percentage of true
LabelRegressionValues <- 377 +1121
LabelRegressionValues
TrueLabelRegression <- 377/1498
TrueLabelRegression
## This shows us that our accuracy in comparison to our label variable is less due to the label being 0.4888 while the 
## label_regression percent is 0.2516689.















