##########################################################################################################

## Coursera Exploratory Data Analysis Course Week 1 Assignment
## Akshat S Prakash
## 2018-05-27

# expDatAna_W1.R File Description:

# This script will perform the following steps on the UC Irvine ML Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
# 1. Loading and preparing the data
# 2. Making Plot 2

##########################################################################################################


## Step 1: Reading download txt files to load the data sets
##rm(list = ls() )
powerData <- read.csv2("~/data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", dec=".")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y", tz="UTC")
powerData <- subset(powerData, `Date` == "2007-02-01" | `Date` == "2007-02-02")

xAxis <- paste(powerData$Date, powerData$Time)
xAxis <- as.POSIXct(xAxis)

## Step 2: Make Plot 2
png(file = "data/plot2.png", height = 480, width = 480)
plot(xAxis, powerData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()