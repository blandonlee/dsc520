# DSC 520
# 4.2 Exercise
# Blandon Lee
# 01/06/2022

# Import Data

score <- read.delim("C:/Users/bland/Desktop/score.txt", stringsAsFactors=TRUE)

# Use the appropriate R functions to answer the following questions:

# What are the observational units in this study?

observ.units <- function()
{
  sprintf('sports,regular')
}

observ_units()

# Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?

score.var <- function(categorical = "count and section",quantitative = "score")
{
  print('categorical= count and section')
  print('quantitative= score')
}

score.var()

# Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.

df <- data.frame(score)
print(score)

sports <- subset(df, Section == 'Sports')
print(sports)

regular <- subset(df, Section == 'Regular')
print(regular)


# Use the Plot function to plot each Sections scores and the number of students achieving that score. 


indexplot(score[,'Count', drop=FALSE], type='h', id.method='y', id.n=2, 
          groups=score$Section)

indexplot(score[,'Score', drop=FALSE], type='h', id.method='y', id.n=2, 
          groups=score$Section)

#  Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: 
## Can you say that one section tended to score more points than the other? Justify and explain your answer.

# Answer--- By looking at the score graph I cannot say that one was more consistent that the other. Both groups were
#           staggered across the plot fairly evenly. However, the highest score was achieved in the sports section.

#  Did every student in one section score more points than every student in the other section? 
## If not, explain what a statistical tendency means in this context.

# Answer--- No every student in one section didn't outscore the other section. In my mind what it means is that the subject content
#           mat have benefits for certain individuals, but across the board sports themed or not made no real difference overall.

#  What could be one additional variable that was not mentioned in the narrative that could be influencing the point distributions 
## between the two sections?

# Answer--- With the regular section not knowing what to expect from the class may have been a factor. With the sports class they had 
#           a general idea as to what they are getting into.    










