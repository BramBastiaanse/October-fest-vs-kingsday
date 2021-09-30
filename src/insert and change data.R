#src file
# Install required packages
library(data.table)
install.packages("R.utils")
library(R.utils)
library(dplyr)

# Getting data for Shanghai and Singapore
## Shanghai
# Listings
shanghai_listing <- read.csv("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/visualisations/listings.csv")

# Calendar
shanghai_calendar <- fread("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/data/calendar.csv.gz")

# Singapore 
# Listing
read.csv("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/visualisations/listings.csv")
singapore_listing <-read.csv("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/visualisations/listings.csv")

# calendar
Singapore_calendar <- fread("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/data/calendar.csv.gz")

#create subset & exclude variables
Shanghai_total <- subset(shanghai_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))

singapore_total <- subset(singapore_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))

#rename listing_id to id
colnames(shanghai_calendar)[colnames(shanghai_calendar) == "listing_id"] <- 'id'

colnames(Singapore_calendar)[colnames(Singapore_calendar) == "listing_id"] <- 'id'

#Merge _calendar with _total based on 'id'
shanghai_total1 <- merge(Shanghai_total, shanghai_calendar, by ='id')
singapore_total1 <- merge(singapore_total, Singapore_calendar, by ='id')

# Create dummy variabe
shanghai_total1%race_weekend <-  shanghai_total1$date >=  "2022-04-22" & shanghai_total1$date <= "2022-04-24" 

# Create dummy variable based on raceweekend dates
shanghai_total1$race_weekend <- ifelse(shanghai_total1$date == as.Date("2022-04-22") | shanghai_total1$date == as.Date("2022-04-23") | shanghai_total1$date == as.Date("2022-04-24"), 1, 0) 
summary(shanghai_total1$race_weekend)

#delete rows from shaghai_total that dont match with shaghai_calendar by 'id'
unwanted <-which(!rownames(Shanghai_total) %in% rownames(shanghai_calendar))    
environment2<-Shanghai_total[-unwanted,]

unwanted <-which(!rownames(Shanghai_total) %in% rownames(shanghai_calendar))    
environment2<-Shanghai_total[-unwanted,]


#### WE MIGHT WANT TO DELETE THIS #####

# Create new datasets filtered on event date
singapore_grandprix <- singapore_total1 %>%
  filter(date >= "2022-04-22" & date <= "2022-04-24")

shanghai_grandprix <- shanghai_total1 %>%
  filter(date >= "2022-04-22" & date <= "2022-04-24")

View(shanghai_grandprix)
View(singapore_grandprix)

