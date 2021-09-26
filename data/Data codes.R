# Install required packages
library(data.table)
install.packages("R.utils")
library(r.utils)

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

View(shanghai_total1)
View(singapore_total1)


#delete rows from shaghai_total that dont match with shaghai_calendar by 'id'
unwanted <-which(!rownames(Shanghai_total) %in% rownames(shaghai_calendar))    
environment2<-shanghain_total[-unwanted,]

unwanted <-which(!rownames(Shanghai_total) %in% rownames(shaghai_calendar))    
environment2<-shanghain_total[-unwanted,]