library(broom)
library(car)

# Regression Models


shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, shanghai_total1)


spain_total1_lm1 <- lm(spain_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, spain_total1)


##### if We want to plot #####
samplesize=1E3
shanghai_total1_lm2 <-  lm(shanghai_total1$adjprice_corrected ~ race_weekend, shanghai_total1, subset = sample(1:nrow(shangai_total1, samplesize)))

# Save regression output 

# save to gen

sink(file = "gen/output/lm_output2")
summary(shanghai_total1_lm1)
sink(file = NULL)

sink(file = "gen/output/lm_output_spain")
summary(spain_total1_lm1)
sink(file = NULL)