nycData$longitudeRadian <- nycData$longitude * (3.1416/180)

nycData$latitudeRadian <- nycData$latitude * (3.1416/180)

#manhattan's longtitude and latitude

# 40.78343, -73.96625

manhattanLongitude <- -73.96625*(3.1416/180)

manhattanLatitude <- 40.78343*(3.1416/180)

#Haversine formulae

for(i in 1:48895){
  a <- (sin((manhattanLatitude - nycData$latitudeRadian[i])/2))^2 + (cos(manhattanLatitude)* cos(nycData$latitudeRadian[i])*(sin((manhattanLongitude - nycData$longitudeRadian[i])/2))^2)
  c <- 2 * atan2(sqrt(a), sqrt(1-a))
  nycData$distanceFromManhattan[i] <- 6371*c 
}

# Categorize the distanceFromManhattan variable
for (i in 1:48895) {
  if (nycData$distanceFromManhattan[i] <= 4.4676940    ) {
    nycData$distanceFromManhattanCat[i] <- "0 to 4.46 km"
  } else if (nycData$distanceFromManhattan[i] > 4.4676940 & nycData$distanceFromManhattan[i] <= 7.6721030 ) {
    nycData$distanceFromManhattanCat[i] <- "4.46 to 7.67 km"
  } else if (nycData$distanceFromManhattan[i] > 7.6721030  & nycData$distanceFromManhattan[i] <= 11.1516474 ) {
    nycData$distanceFromManhattanCat[i] <- "7.67 to 11.15 km"
  } else {
    nycData$distanceFromManhattanCat[i] <- "More than 11.15 km"
  }
}

library(gplots)

plotmeans(price ~ distanceFromManhattanCat, data = nycData, frame = FALSE,
          mean.labels = TRUE, connect = TRUE)
