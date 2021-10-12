library(ggplot2)
library(ggplot2)
library(ggfortify)
library(broom)
library(dplyr)
library(stargazer)

# Regression Models


shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, shanghai_total1)
summary(shanghai_total1_lm1)


spain_total1_lm1 <-  lm(spain_total1$adjprice_corrected ~ race_weekend + distance + type_of_room + distance, spain_total1)
summary(spain_total1_lm1)
shanghai_total1_lm2 <-  lm(shanghai_total1$adjprice_corrected ~ race_weekend, shanghai_total1 )

plot(shanghai_total1_lm2)

samplesize=1E3
shanghai_total1_lm2 <-  lm(shanghai_total1$adjprice_corrected ~ race_weekend, shanghai_total1, subset = sample(1:nrow(shangai_total1, samplesize)))

stargazer(shanghai_total1_lm1, 
          title = "title", 
          dep.var.caption = "caption",
          dep.var.labels = "",
          covariate.labels = c("race_weekend", "distance", "type_of_room"),
          column.labels = c("estimate", "std. error", "t-value", "Pr(>|t|)"),
          notes.label = "signifance levels",
          type = "html",
          out = "output.html")
          
sink(file = "lm_output")
summary(shanghai_total1_lm1)
sink(file = NULL)




