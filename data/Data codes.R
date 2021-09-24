# Getting data for Shanghai and Singapore
## Shanghai
# Listings
shanghai_listing <- read.csv("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/visualisations/listings.csv")
View(shanghai_listing)

# Calendar
library(data.table)
install.packages("R.utils")
library(r.utils)
shanghai_calendar <- fread("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/data/calendar.csv.gz")
View(shanghai_calendar)



# Singapore 
# Listing
read.csv("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/visualisations/listings.csv")
singapore_listing <-read.csv("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/visualisations/listings.csv")
View(singapore_listing)

# calendar
Singapore_calendar <- fread("http://data.insideairbnb.com/singapore/sg/singapore/2021-07-19/data/calendar.csv.gz")
View(Singapore_calendar)

View(singapore_calendar)

#create subset & exclude variables
Shanghai_total <- subset(shanghai_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))
View(Shanghai_total)

#rename listing_id to id
colnames(shanghai_calendar)[colnames(shanghai_calendar) == "listing_id"] <- 'id'

#Merge shanghai_calendar with shanghai_total based on 'id'
shanghain_total <- merge(Shanghai_total, shanghai_calendar, by ='id')

#delete rows from shaghai_total that dont match with shaghai_calendar by 'id'
unwanted <-which(!rownames(Shanghai_total) %in% rownames(shaghai_calendar))    
environment2<-shanghain_total[-unwanted,]