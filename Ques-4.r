nycData <- read.csv(file = "AB_NYC_2019.csv")

#Which type of room is the cheapest and is that more popular among the customers?

library(ggplot2)
library(gplots)
install.packages('gplots')

#check which one is the cheapest
ggplot(nycData, aes(x=room_type, y=price)) + 
  geom_boxplot()

#mean plot to be extra sure
plotmeans(price ~ room_type, data = nycData, frame = FALSE,
          mean.labels = TRUE, connect = FALSE)

#We found that shared room is the cheapest
#Now let's see is that most popular among the customers of arbnb

ggplot(nycData, aes(x=room_type, y=number_of_reviews)) + 
  geom_boxplot()

#mean plot to be extra sure
plotmeans(number_of_reviews ~ room_type, data = nycData, frame = FALSE,
          mean.labels = TRUE, connect = FALSE)










