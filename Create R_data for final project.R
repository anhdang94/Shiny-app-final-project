
#Load the Library
library(shiny)
library(ggplot2)
library(tidyverse)
library(RCurl)
x <- getURL("https://raw.githubusercontent.com/anhdang94/Shiny-app-final-project/master/Shareholder%20letters%20data.csv")
shletter<-read.csv(text = x)

summary(shletter)

#Rename columns
names(shletter)[3] <- "Net_Income"
names(shletter)[4] <- "Revenue"
names(shletter)[5] <- "Year_end_stock_price"
names(shletter)[6] <- "EPS"

names(shletter)[9] <- "Shareholders_Letter"
names(shletter)[10] <- "CEO_photo"
names(shletter)[11] <- "Other_Financial_info"

save(t, file="./Data/nic-cage.RData")
load(url("https://raw.githubusercontent.com/mattdemography/STA_6233/master/Data/nic-cage.RData"))

