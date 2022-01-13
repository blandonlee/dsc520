# DSC 520/Week 5 
# 5.2 Exercise
# Blandon Lee
# 01/12/2022

library(dplyr)
library(purrr)

# Dplyr Operators
# GroupBy, Summarize, Mutate, Filter, Select, and Arrange

group_by(week_6_housing, square_feet_total_living > 2000, Sale.Price < 600000)

filter(week_6_housing, Sale.Price < 500000)

summarize(week_6_housing, max_sqft = max(sq_ft_lot), min_sqft = min(sq_ft_lot))

mutate(week_6_housing, price_per_sqft = Sale.Price/square_feet_total_living)

select(week_6_housing, sq_ft_lot, Sale.Price)

arrange(week_6_housing, Sale.Price)

# Using the purrr package - perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.

housing <- list(Sale.Price = c(698000, 649990, 572500, 420000), Sqft = c(2810, 2880, 2770, 1620))

housing %>%
  discard(is.character)

housing %>%
  keep(~ length(.) == 2)


# Use the cbind and rbind function on your dataset

df <- data.frame(Sale.Price = c(698000, 649990, 572500, 420000),
                 Sqft = c(2810, 2880, 2770, 1620))
print(df)

df2 <- data.frame(bedrooms = c(4,4,4,3))
                 
print(df2)

join_data <- cbind(df, df2)

print(join_data)


Sale.Price <- c(698000, 649990, 572500, 420000)
Sqft <- c(2810, 2880, 2770, 1620)

join_data2 <- rbind(Sale.Price, Sqft)

print(join_data2)

# Split a string, then concatenate the results back together

intro_message <- ('The housing sales list for Major Reality Firm')
strsplit(intro_message, split = ' ')

paste(intro_message, sep = , collapse = NULL)




