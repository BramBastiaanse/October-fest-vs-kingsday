shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance, shanghai_total1)
summary(shanghai_total1_lm1)