nycData <- read.csv(file = "AB_NYC_2019.csv")

#ques:  Does location has an impact on price?

quantile(nycData$price)


# Categorize the price variable
for (i in 1:48895) {
  if (nycData$price[i] <= 69) {
    nycData$priceCategory[i] <- "Low"
  } else if (69 < nycData$price[i] & nycData$price[i] <= 106) {
    nycData$priceCategory[i] <- "Medium"
  } else if (nycData$price[i] > 106 & nycData$price[i] <= 175) {
    nycData$priceCategory[i] <- "High"
  } else {
    nycData$priceCategory[i] <- "Extremely High"
  }
}

library(ggplot2)

#scatterplot
ggplot(nycData) +
  aes(x = longitude, y = latitude, color = priceCategory) +
  geom_point() +
  scale_color_manual(values = c("#FF3333", "#FFB533", "#5D6D7E", "#3349FF"))

#histogram
ggplot(nycData, aes(x = price, fill = neighbourhood_group)) +
  geom_histogram(boundary = 0, breaks = c(0 ,69, 106, 175, 10000))
