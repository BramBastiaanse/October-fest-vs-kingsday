# Which Air BnB sits on pole position? 

Which Grand Prix (Spanish Grand Prix or Chinese Grand Prix) affect demand and prices most. 

![Airbnb/F1 logo](https://user-images.githubusercontent.com/83360520/137388689-e9d3e154-86c9-4b74-8168-79e2f2d3c0e8.png)


## Research Motivation

We want to assess and investigate; how the Grand Prix locations during a Grand Prix weekend affects local AirBnB market (demand, supply and price) in Spain and Shanghai. Our motivation is to offer a clear understanding and picture to the landlords and to the consumers about the prices and availability of the AirBnb houses. For landlords, we like to assess the prices during these events and state a profitable period to place an ad on AirBnb. For the consumers, we like to estimate the most affordable AirBnbs during the Formula 1 events. So, both landlords and consumers will have an vision about the pricing and the availability of the AirBnbs in Spain and Shanghai during race weekends.

## Method and results

### Data 

We downloaded the Airbnb data for this project from the [InsideAirbnb](http://insideairbnb.com/get-the-data.html) website. We use datasets with information on Airbnb listings in Singapore and Barcelona, as these are the cities where the Grand Prix' take place. 

### Data preperation

In R, we then excluded the variables that we considered not useful for our analysis and created a subset for both Barcelona (Spain) and Shanghai. This resulted in the following code:

```
Shanghai_total <- subset(shanghai_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))
Spain_total <- subset(spain_listing, select = -c (host_name, last_review, reviews_per_month, calculated_host_listings_count, license, neighbourhood_group, minimum_nights, number_of_reviews_ltm))
```

We then had to create dummy variables based on the raceweekend data. These dummies indicate whether the date matches the dates of the raceweekend. 
The Shanghai Grand Prix is going to take place from the 22th of April until the 24th of April.
The Barcelona Grand Prix is going to take place from the 20th of May until the 22th of May. 

Next, we created a dummy variable on the type of room. It shows whether a listing is an entire home/apartment or not.

At last, we needed to create a variable on the distance of the Airbnbs to the racing circuits. We computed the distance by running the following code: 

```
earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}
```

In order to solve the our research question, we needed to compare the regression analyses of both cities during race weekends(Barcelona, Spain and Shanghai, China). Using a regression analysis, we can view whether the independent variable (race weekend) and controlvariables are significant on the rent of an AirBnB in one of the cities. 

### Results

#### Spain output

_lm(formula = spain_total1$adjprice_corrected ~ race_weekend + 
    distance + type_of_room + distance, data = spain_total1)_

|        | Min. | 1Q   | Median | 3Q  | Max  
|-----------|------|------|--------|-----|-------
|Residuals  |-583.7|-325.8| -64.2  |-36.5|9920.8 


**Coefficients:**


| | Estimate | Std. Error | t value | Pr(>t) |
|--------------|------------|------------|---------|----------
|Intercept    | 16782.4614 | 2195.2898  | 7.645   | 2.09e-14*** 
|race_weekend |  144.4319  |    5.3585  | 26.954  | < 2e-16***  
|distance     |   -2.8424  |    0.3736  | -7.608  | 2.79e-14***
|type_of_room |   359.3104 |    0.9711  | 370.012 | < 2e-16***  

_Signif. codes:  0***  0.001**  0.01*  0.05‘.’  0.1 ‘’  1_

- Residual standard error: 1208 on 6232534 degrees of freedom
_(938 observations deleted due to missingness)_
- Multiple R-squared:  0.02179
- Adjusted R-squared:  0.02179 
- F-statistic: 4.628e+04 on 3 and 6232534 DF.
- p-value: < 2.2e-16


#### Shanghai output

_lm(formula = shanghai_total1$adjprice_corrected ~ race_weekend + 
    distance + type_of_room + distance, data = shanghai_total1)_

|         | Min. | 1Q   | Median | 3Q  | Max  
|-----------|------|------|--------|-----|-------
|Residuals  |-1814 |-692| -343 |-21|98515 
 


**Coefficients:**
 
 | | Estimate | Std. Error | t value | Pr(>t) |
|--------------|------------|------------|---------|----------
|Intercept    | -101.75715  | 2.57745  | -39.480   | <2e-16 *** 
|race_weekend |  5.45109   |    8.49742  | 0.642  | 0.521  
|distance     |   15.12729   |     0.05728  | 264.082   | <2e-16 ***
|type_of_room |   822.76359 |     1.60808  | 511.645 | < 2e-16***  

_Signif. codes:  0***  0.001**  0.01*  0.05‘.’  0.1 ‘’  1_

- Residual standard error: 2407 on 9846975 degrees of freedom
- Multiple R-squared:  0.02767	
- Adjusted R-squared:  0.02767 
- F-statistic: 9.341e+04 on 3 and 9846975 DF 
- p-value: < 2.2e-16


Considering the output it is concluded that raceweekend has a significant effect on the price during the Spanish Gran Prix. The data indicates that when the Spanish Gran Prix is held, the price increases by 144,4319 euros. In contrast, it is conculded that when the raceweekend is held in Shanghai, it does not have a significant effect on price. Furthermore, the price increase of an AirBnB only increases by 5,45109 euros when the Shanghai Gran Prix is held.

On an interesting note, the data shows that the distance between the AirBnB and a racetrack has a signifcant effect on the price of an AirBnB. This conclusion holds for both Shanghai, China, and Barcelona, Spain. Further research needs to be conducted to find an explanation for this phenomenon, especially in the case of Shanghai, China. 


## Repository overview

Our repository contains the following folders:
- scr
- gen
- data

It also contains three files:
- .gitignore file. Contains all the files that should be ignored.
- README.md file. File that you are currently viewing. Contains the motivation on the research project, instruction on how to run the analysis and the results of the project. 
- makefile. Enables you to run the code automatically. 

## Running instructions
For those who are interested in running the data please folllow the following steps:
1. Open and run download_data.R
2. Open and run datapreperation.R
3. Open and run analysis.R

You will find the output in gen/output. 

For those interested in replicating the analyisis with different data:
Input:
- Circuit coordinates
- Grand Prix dates

1. In "download_data.R" the URLs can be tranformed to the desired city which hosts a Gran Prix. 
2. Alter the dummy variables to match the race weekend in datapreperation.R. 
3. Alter the coordinates in datapreperation.R, where you first need to provide the longtitude, followed by the latitude. 

### Required software

- Install [R and RStudio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- Install additional packages:

```
install.packages("data.table")
install.packages("R.utils")
install.packages("dplyr")
install.packages("readr")
install.packages("car")
install.packages("ggplot2")
```

### Required data

The datasets that are used in this project can be downloaded [here](http://insideairbnb.com/get-the-data.html).

## More resources

- Related literature: Haywood, J., Mayock, P., Freitag, J., Owoo, K. A., & Fiorilla, B. (2017). Airbnb & hotel performance. STR publication.
- All Airbnbs located in Barcelona can be found by clicking this [link](http://insideairbnb.com/barcelona/)
- All Airbnbs located in Shanghai can be found by clicking this [link](http://insideairbnb.com/shanghai/)

## About

This repository serves as an assignment for the course [data prepration and workflow management](https://dprep.hannesdatta.com/) at Tilburg University. 

Team members: 
- [Robbin de Waal](https://github.com/robbindewaal)
- [Efe Kiremitci](https://github.com/efekiremitci97) 
- [Niels Rahder](https://github.com/NielsRahder)
- [Xenia Tijssen](https://github.com/xeniatijssen)  
- [Bram Bastiaanse](https://github.com/BramBastiaanse)


