# Assignment: American Community Survey Exercise
# Blandon Lee
# 12/15/2021


# Load the ggplot2 package
library(ggplot2)
theme_set(theme_minimal())

# Load the qqplotr package
library(qqplotr)

# Set the working directory to the root of your DSC 520 directory
setwd('C:/Users/bland/Documents/GitHub/dsc520')

## Load the `data/acs-14-1yr-s0201.csv` to
survey_df <- read.csv('C:/Users/bland/Documents/GitHub/dsc520/data/acs-14-1yr-s0201.csv')

# 1. WHAT ARE THE ELEMENTS IN YOUR DATA(INCLUDING THE CATEGORIES AND DATA TYPES)?
# Elements are as follows
# Id-1 and Id-2 - Character/Integer
# Geography/Location - Character
# Population Group Id/display label - Integer
# Reported Race - Integer 
# High School Degrees - Numeric
# Bachelor Degrees- Numeric

# 2. PLEASE PROVIDE THE OUTPUT FOR THE FOLLOWING FUNCTIONS: str(); nrow(); ncol()
str(survey_df)
nrow(survey_df)
ncol(survey_df)

# 3. CREATE A HISTOGRAM OF THE HSDEGREE VARIABLES USING GGPLOT2.
ggplot(survey_df, aes(HSDegree)) + geom_histogram(bins=30) + ggtitle("HSDegree Distribution") + xlab("High School Degree Percentage") + ylab("Count")

# 4. ANSWER THE FOLLOWING QUESTIONS BASED ON THE HISTOGRAM PRODUCED:
# A.Based on what you see in this histogram, is the data distribution unimodal?
names(table(survey_df$HSDegree))[table(survey_df$HSDegree)==max(table(survey_df$HSDegree))]
# Answer: It has one prominate peak so it would be a unimodal 

# B.Is it approximately symmetrical?
mean(survey_df$HSDegree)
median(survey_df$HSDegree)
# Answer: Close but now quite.

# C. Is it approximately bell-shaped?
sd(survey_df$HSDegree)
# Answer: No

# D. Is it approximately normal?
y <- dnorm(survey_df$HSDegree, mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree))
plot(survey_df$HSDegree, y)
# Answer: No

# E. If not normal, is the distribution skewed? If so, in which direction?
# Answer: Negativly Skewed

# F. Include a normal curve to the Histogram that you plotted.
ggplot(survey_df, aes(x=HSDegree)) + geom_histogram(aes(y=..density..,bins=25)) + ggtitle("HSDegree Distribution") + xlab("High School Degree Percentage") + 
  ylab("Count") + stat_function(fun=dnorm, color = "red", args = list(mean = mean(survey_df$HSDegree), sd = sd(survey_df$HSDegree)))

# G. Explain whether a normal distribution can accurately be used as a model for this data.
# Answer: Normal distribution cannot be used because it is negatively skewed.

# 5. CREATE A PROBABILITY PLOT OF THE HSDEGREE VARIABLE.
ggplot(survey_df, aes(sample=HSDegree)) + stat_qq_point(color="red") + stat_qq_line(color="blue")

# 6. Answer the following questions based on the Probability Plot:
# A. Based on what you see in this probability plot, is the distribution approximately normal? Explain how you know.
# Answer: It is not normal because there is a curve instead of being straight. 
# B. If not normal, is the distribution skewed? If so, in which direction? Explain how you know.
# Answer: It is negativly skewed down and to the right compared to the normal line.

# 7.Now that you have looked at this data visually for normality, you will now quantify normality with numbers using the stat.desc() function. Include a screen capture of the results produced.
library(pastecs)
stat.desc(survey_df$HSDegree)

# 8. In several sentences provide an explanation of the result produced for skew, kurtosis, and z-scores. In addition, explain how a change in the sample size may change your explanation?
# A. Skew - Negative
# B. Kurtosis - Platykurtic
# C. Z-scores - Positive value
# D. If it is changed and new values are added in the lower side of the curve then normal distribution is possible.

