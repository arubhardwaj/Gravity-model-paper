# Required libraries

library(xtable)
library(tidyverse)
library(gravity)
library(plm)
library(texreg)
library(ggally)
library(lmtest)
library(pastecs)
library(corrplot)

# Data
data <- read.csv("/cloud/project/Panel sheet Clear - Sheet1.csv", header = TRUE)
attach(data)
ltrade <- log(bilateral_trade)
ldist <- log(distance_km)
lchinaGDP <- log(china_gdp)
lGDP <- log(country_gdp)
lchinaPop <- log(china_population)
lPop <- log(country_population)
ExRate <- (china_exchange/exchange_rate)


p.df <- data.frame(Country, Year, bilateral_trade, ltrade, ldist, lchinaGDP, lGDP, lchinaPop, lPop, ExRate, landlock_dummy)
View(p.df)
panel <- pdata.frame(p.df, index = c("Country", "Year"))

stat <- data.frame(ltrade, ldist, lchinaGDP, lGDP, lchinaPop, lPop, ExRate, landlock_dummy)



