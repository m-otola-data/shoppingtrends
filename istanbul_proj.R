# Omotola Anibaba Portfolio Project
# Analyzing Istanbul Shopping Trends

# First step, installing all the necessary packages and loading them
install.packages("tidyverse")
install.packages("janitor")
install.packages("skimr")
install.packages("readr")
install.packages("dplyr")
install.packages("ggplot2")

library(tidyverse)
library(janitor)
library(skimr)
library(readr)
library(dplyr)
library(ggplot2)

# Loading customer shopping .csv file
read.csv("customer_shopping_data.csv")
head(customer_shopping_data)

# Analyzing trends among age groups. First we will look at the 
# minimum and maximum age values to figure out how to group them.
min(customer_shopping_data$age, na.rm=T)
max(customer_shopping_data$age, na.rm=T)
# Note that the youngest shopper reported is 18 years old, oldest is 69 years old.

# I decided to look at trends among 5 age groups, (18-29), (30-39), (40-49), (50-59), (60-69)
# First we will look at common categories among men in these 5 age groups. In other words,
# in which shopping categories were men (in their age groups) making the most purchases?

men_shopping <- subset(customer_shopping_data, gender=="Male")
men_18_29 <- subset(men_shopping, age>= 18 & age <=29)
men_30_39 <- subset(men_shopping, age>= 30 & age <=39)
men_40_49 <- subset(men_shopping, age>= 40 & age <=49)
men_50_59 <- subset(men_shopping, age>= 50 & age <=59)
men_60_69 <- subset(men_shopping, age>= 60 & age <=69)

# Same concept for women shoppers
women_shopping <- subset(customer_shopping_data, gender=="Female")
women_18_29 <- subset(women_shopping, age>=18 & age <= 29)
women_30_39 <- subset(women_shopping, age>=30 & age <= 39)
women_40_49 <- subset(women_shopping, age>=40 & age <= 49)
women_50_59 <- subset(women_shopping, age>=50 & age <= 59)
women_60_69 <- subset(women_shopping, age>=60 & age <= 69)

# p <- ggplot(data=women_shopping, aes(x=quantity,y=category,color="pink"))+geom_bar(stat="identity")
# p + xlim(1,5)
# p

f <- ggplot(data=women_18_29, aes(x=quantity,y=age))+geom_bar(stat="identity")
women_18_29
