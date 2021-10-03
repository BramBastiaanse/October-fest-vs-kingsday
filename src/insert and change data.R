#src file
# Install required packages
library(data.table)
install.packages("R.utils")
library(R.utils)
library(dplyr)

## Getting data for Shanghai and Spain ##
## Shanghai
# Listings
shanghai_listing <- read.csv("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/visualisations/listings.csv")
View(shanghai_listing)
# Calendar
shanghai_calendar <- fread("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/data/calendar.csv.gz")
View(shanghai_calendar)

# Spain 
# Listing
spain_listing <-read.csv("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/visualisations/listings.csv")
View(spain_listing)
# calendar
spain_calendar <- fread("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/data/calendar.csv.gz")
View(spain_calendar)

#create subset & exclude variables
Shanghai_total <- subset(shanghai_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))

spain_total <- subset(spain_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))


#rename listing_id to id
colnames(shanghai_calendar)[colnames(shanghai_calendar) == "listing_id"] <- 'id'

colnames(spain_calendar)[colnames(spain_calendar) == "listing_id"] <- 'id'


#Merge _calendar with _total based on 'id'
shanghai_total1 <- merge(Shanghai_total, shanghai_calendar, by ='id')
View(shanghai_total1)
spain_total1 <- merge(spain_total, spain_calendar, by ='id')
View(spain_total1)


# Create dummy variable based on raceweekend dates
shanghai_total1$race_weekend <- ifelse(shanghai_total1$date == as.Date("2022-04-22") | shanghai_total1$date == as.Date("2022-04-23") | shanghai_total1$date == as.Date("2022-04-24"), 1, 0) 
summary(shanghai_total1$race_weekend)
spain_total1$race_weekend <- ifelse(spain_total1$date == as.Date("2022-05-20") | spain_total1$date == as.Date("2022-05-21") | spain_total1$date == as.Date("2022-05-22"), 1, 0) 
summary(spain_total1$race_weekend)

###Linear Regression Models For Shanghai
##control variables
#room_type #size of accommodation##
#- number_of_reviews#
#- distance to circuit: we have to build 6 linear regression models without intercept - Niels is doing it

shanghai_total1_lm1 <- lm(adjusted_price~ room_type, shanghai_total1);
summary(shanghai_total1_lm1)

shanghai_total1_lm2 <- lm(adjusted_price~number_of_reviews, shanghai_total1);
summary(shanghai_total1_lm2)

shanghai_total1_lm3 <- lm(adjusted_price ~ race_weekend, shanghai_total1);
summary(shanghai_total1_lm3)

# room type has 3 three options so we might have to create dummy for them as well







