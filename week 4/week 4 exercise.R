# DSC 520
# Week 4
# Blandon Lee
# 1/7/2022

# Use the apply function on a variable in your dataset

ma <- matrix(c(99088,649990,572500), nrow=3, ncol=1)
print(ma)

apply(ma, 2, sum)

# Use the aggregate function on a variable in your dataset

df <- data.frame(week_6_housing)
print(df)

data(week_6_housing, package = "ggplot2")
head(df)
aggregate(x = df[, colnames(df) != 'sale.price'],list(df$sale.price), mean, na.rm = TRUE)


#  Use the plyr function on a variable in your dataset more specifically, 
## I want to see you split some data, perform a modification to the data, and then bring it back together

library(plyr)

d <- week_6_housing

week_6_housing <- week_6_housing[week_6_housing$year_built >= 2000, ]
week_6_housing[ , c("year_built","bedrooms")]


ddply(d, "year_built", function(x) {
  mean.count <- mean(x$count)
  sd.count <- sd(x$count)
  cv <- sd.count/mean.count
  data.frame(cv.count = cv)
  })

ddply(week_6_housing, "sq_ft_lot", summarise, mean.count = mean(count))

# Check distributions of the data
plotDistr(.x, dnorm(.x, mean=0, sd=1), cdf=FALSE, xlab="x", 
          ylab="Density", 
          main=paste("Normal Distribution:  Mean=0, Standard deviation=1"))
})
# Identify if there are any outliers
ggplot(week_6_housing) +
  aes(x = year_built) +
  geom_histogram(bins = 30L, fill = "#0c4c8a") +
  theme_minimal()

# Create at least 2 new variables

week_6_housing_1 <- week_6_housing
week_6_housing_1$color <- "blue"
print(week_6_housing_1)

week_6_housing_2 <- week_6_housing_1
week_6_housing_2$material <- "stone"
print(week_6_housing_2)
