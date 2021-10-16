library(broom)
library(car)

# Regression Models
shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, shanghai_total1)
spain_total1_lm1 <- lm(spain_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, spain_total1)


# Save regression output 

sink(file = "gen/output/regression_analysis_Shanghai")
summary(shanghai_total1_lm1)
sink(file = NULL)

sink(file = "gen/output/regression_analysis_Spain")
summary(spain_total1_lm1)
sink(file = NULL)