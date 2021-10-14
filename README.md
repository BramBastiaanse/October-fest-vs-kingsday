# Which Air BnB sits on pole position? 

Which Grand Prix (Spanish Grand Prix or Chinese Grand prix) affect demand and prices most. 

![Airbnb/F1 logo](https://user-images.githubusercontent.com/83360520/137388689-e9d3e154-86c9-4b74-8168-79e2f2d3c0e8.png)


## Research Motivation

We want to assess and investigate; how the Grand Prix locations during a Grand Prix weekend affects local AirBnB market (demand,supply and price) in Spain and Shanghai. Our motivation is to offer a clear understanding and picture to the landlords and to the consumers about the prices and availability of the AirBnb houses. For landlords, we like to assess the prices during these events and state a profitable period to place an ad on AirBnb. For the consumers, we like to estimate the most affordable AirBnbs during the Formula 1 events. So, both landlords and consumers will have an vision about the pricing and the availability of the AirBnbs in Spain and Shanghai during race weekends.

## Data

For this project, Airbnb data is used from Inside Airbnb. We use datasets with information on Airbnb listings in Singapore and Barcelona, as these are the cities where the Grand Prix' take place. 

## Method and results

In order to solve the our research question, we needed to compare the regression analyses of both cities during race weekends(Barcelona, Spain and Shanghai, China). Using a regression analysis, we can view whether the independent variable (race weekend) and controlvariables are significant on the rent of an AirBnB in one of the cities. 

## Repository overview

Our repository contains the following folders:
- scr
- gen
- data

## Running instructions

### Required software

* Install [R and RStudio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
* Install [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)

### Required data

The datasets that are used in this project can be downloaded below. Make sure to download **all** of the 4 datasets. 

#### Barcelona
* [Barcelona Listings](http://data.insideairbnb.com/spain/catalonia/barcelona/2021-09-10/visualisations/listings.csv)
* [Barcelona Calendar](http://data.insideairbnb.com/spain/catalonia/barcelona/2021-09-10/data/calendar.csv.gz)

#### Shanghai 
* [Shanghai Listings](http://data.insideairbnb.com/china/shanghai/shanghai/2021-09-28/visualisations/listings.csv)
* [Shanghai Calendar](http://data.insideairbnb.com/china/shanghai/shanghai/2021-09-28/data/calendar.csv.gz)

(Improve once we actually start on this thing)

Explain to potential users how to run/replicate your workflow. Touch upon, if necessary, the required input data, which (secret) credentials are required (and how to obtain them), which software tools are needed to run the workflow (including links to the installation instructions), and how to run the workflow. Make use of subheaders where appropriate.

## More resources

View the source files _here_ (insert link)

## About

This repositiory has been created by Robbin de Waal, Efe Kiremitci, Niels Rahder, Xenia Tijssen and Bram Bastiaanse. This repository serves as an assignment for the course data prepration and workflow management at Tilburg University. 
