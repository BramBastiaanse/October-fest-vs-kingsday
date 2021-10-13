# Download data
library(data.table)

#Download data
shanghai_listing <- read.csv("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/visualisations/listings.csv")
shanghai_calendar <- fread("http://data.insideairbnb.com/china/shanghai/shanghai/2021-07-31/data/calendar.csv.gz")

spain_listing <- read.csv("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/visualisations/listings.csv")
spain_calendar <- fread("http://data.insideairbnb.com/spain/catalonia/barcelona/2021-07-07/data/calendar.csv.gz")
