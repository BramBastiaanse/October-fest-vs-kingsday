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

