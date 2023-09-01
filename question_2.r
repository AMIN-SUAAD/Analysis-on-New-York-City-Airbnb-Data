nycData <- read.csv(file = "AB_NYC_2019.csv")

# Does the geographic location have a significant effect on the type of room?

library(ggplot2)

ggplot(nycData) +
  aes(x = longitude, y = latitude, color = room_type) +
  geom_point(shape = 21, alpha = 0.5, size = 6) +
  scale_color_manual(values = c("#0000FF","#FF0000", "#FFB533"))

# we can observe in a particular location there are more Entire home/apt (Longitude and Latitude range need to be mentioned)

#bar plot can also answer our question

ggplot(nycData, aes(x = room_type, fill = neighbourhood_group)) +
  geom_bar(position = position_dodge()) +
  theme_classic()
