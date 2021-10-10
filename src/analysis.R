# Regression Models

shanghai_total1_lm1 <- lm(shanghai_total1$adjprice_corrected  ~ race_weekend + distance + type_of_room + distance, shanghai_total1)
summary(shanghai_total1_lm1)

shanghai_total1_lm2 <- lm(shanghai_total1$adjprice_corrected ~ shanghai_total1)
summary(shanghai_total1_lm1)
summary(shanghai_total1_lm2)

spain_total1_lm1 <- lm(spain_total1$adjprice_corrected ~ race_weekend + distance, spain_total1)
spain_total1_lm2 <- lm(spain_total1$adjprice_corrected ~ type_of_room + distance, spain_total1)
summary(spain_total1_lm1)
summary(spain_total1_lm2)

# Plots
ggplot(shanghai_total1, aes(x=adjprice_corrected, y=race_weekend)) +
  geom_point()
ggplot(sat, aes(x=adjprice_corrected, y=type_of_room)) +
  geom_point()
ggplot(sat, aes(x=adjprice_corrected, y=distance)) +
  geom_point()

pdf("plot all pdf")
