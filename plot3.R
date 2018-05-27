##########################################################################################################

## Coursera Exploratory Data Analysis Course Week 1 Assignment
## Akshat S Prakash
## 2018-05-27

# plot3.R File Description:

# This script will perform the following steps on the UC Irvine ML Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
# 1. Loading and preparing the data
# 2. Making Plot 3

##########################################################################################################


## Step 1: Reading download txt files to load the data sets
rm(list = ls() )
powerData <- read.csv2("~/data/household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", dec=".")
powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y", tz="UTC")
powerData <- subset(powerData, `Date` == "2007-02-01" | `Date` == "2007-02-02")

xAxis <- paste(powerData$Date, powerData$Time)
xAxis <- as.POSIXct(xAxis)
png(file = "data/plot3.png", height = 480, width = 480)


## Step 2: Make Plot 3
plot(xAxis, powerData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col="black")
lines(xAxis, powerData$Sub_metering_2, type = "l", col="red")
lines(xAxis, powerData$Sub_metering_3, type = "l", col="blue")
legend("topright", lty = 1, cex=1, lwd=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()