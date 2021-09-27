# Getting data for Shanghai and Singapore
library(data.table)
install.packages("R.utils")
library(R.utils)
library(dplyr)

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
