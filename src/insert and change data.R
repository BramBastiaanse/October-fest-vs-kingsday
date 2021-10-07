#src file
# Install required packages
library(data.table)
install.packages("R.utils")
library(R.utils)
library(dplyr)
library(readr)
library(car)
library(ggplot2)
install.packages("geosphere")
library(geosphere)
install.packages("geodist")
library(geodist)

#### INPUT #####

## Shanghai
# Listings
shanghai_listing <- read.csv("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/visualisations/listings.csv")

# Calendar
shanghai_calendar <- fread("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/data/calendar.csv.gz")


# Spain 
# Listing
spain_listing <-read.csv("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/visualisations/listings.csv")

# calendar
spain_calendar <- fread("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/data/calendar.csv.gz")


## TRANSFORMATION ##

#create subset & exclude variables
Shanghai_total <- subset(shanghai_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))

spain_total <- subset(spain_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))


#rename listing_id to id
colnames(shanghai_calendar)[colnames(shanghai_calendar) == "listing_id"] <- 'id'

colnames(spain_calendar)[colnames(spain_calendar) == "listing_id"] <- 'id'


#Merge _calendar with _total based on 'id'
shanghai_total1 <- merge(Shanghai_total, shanghai_calendar, by ='id')

spain_total1 <- merge(spain_total, spain_calendar, by ='id')



# Create dummy variable based on raceweekend dates
shanghai_total1$race_weekend <- ifelse(shanghai_total1$date == as.Date("2022-04-22") | shanghai_total1$date == as.Date("2022-04-23") | shanghai_total1$date == as.Date("2022-04-24"), 1, 0) 

spain_total1$race_weekend <- ifelse(spain_total1$date == as.Date("2022-05-20") | spain_total1$date == as.Date("2022-05-21") | spain_total1$date == as.Date("2022-05-22"), 1, 0) 


## Output ## 

#Linear Regression Models For Shanghai
##control variables
#room_type #size of accommodation##
#- number_of_reviews#
#- distance to circuit: we have to build 6 linear regression models without intercept
# Calculate distance in kilometers f1 circuit and Airbnb's (formula from Conservation Ecology)
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}

#create column with distance in km 
shanghai_total1$distance <- earth.dist(shanghai_total1$longitude, shanghai_total1$latitude, 121.218499126, 31.33666532)



shanghai_total1$adjprice_corrected <- gsub('[.].*', '', shanghai_total1$adjusted_price)
shanghai_total1$adjprice_corrected <- gsub('[,]', '', shanghai_total1$adjprice_corrected)
shanghai_total1$adjprice_corrected <- gsub('[$]', '', shanghai_total1$adjprice_corrected)
shanghai_total1$adjprice_corrected <- as.numeric(shanghai_total1$adjprice_corrected)
shanghai_total1$number_of_reviews = as.numeric(shanghai_total1$number_of_reviews)
shanghai_total1$distance = as.numeric(shanghai_total1$distance)


shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance, shanghai_total1)
summary(shanghai_total1_lm1)



spain_total1$adjprice_corrected <- gsub('[.].*', '', spain_total1$adjusted_price)
spain_total1$adjprice_corrected <- gsub('[,]', '', spain_total1$adjprice_corrected)
spain_total1$adjprice_corrected <- gsub('[$]', '', spain_total1$adjprice_corrected)
spain_total1$adjprice_corrected <- as.numeric(spain_total1$adjprice_corrected)





