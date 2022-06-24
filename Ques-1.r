nycData <- read.csv(file = "AB_NYC_2019.csv")

# ques: Is there any significant linear relationship between the numerical variables of the dataset?

# there are many missing values in the reviews_per_month variable. But, reviews_per_month is missing only when number of reviews variable is zero.
# So, it is logical to replace the missing values by zero.

# checking the above mentioned
sum(nycData$number_of_reviews == 0)
# number_of_reviews is zero 10052 times, let's check whether number_of_reviews = 0 and reviews_per_month = NA both are happening together or not.
sum <- 0
for (i in 1:48895) {
  if (nycData$number_of_reviews[i] == 0 && is.na(nycData$reviews_per_month[i])) {
    sum <- sum + 1
  }
}
print(sum)

# So, both are happening together. Now let's replace.



nycData$reviews_per_month[is.na(nycData$reviews_per_month)] <- 0



# taking only the numerical variables of the nycData

nycNumerical <- subset(nycData, select = c(id, host_id, latitude, longitude, price, minimum_nights, number_of_reviews, reviews_per_month, calculated_host_listings_count, availability_365))

# correlation matrix
M <- cor(nycNumerical)

# plotting the correlation matrix
library(corrplot)
corrplot(M, method = "color")

# our ques can be also answered by using scatterplot matrix

pairs(nycNumerical, pch = 19)






