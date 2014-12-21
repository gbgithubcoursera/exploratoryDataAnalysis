#!/bin/env Rscript

# Read the serialized object into NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Create Baltimore City Data set 
baltimoreData <- subset(NEI, fips == "24510")

# Baltimore's Emissions yearly summation.
baltSum <- aggregate(baltimoreData[c("Emissions")], list(year = baltimoreData$year), sum)

#  Open the PNG device to Plot to.
png('plot2.png', width=480, height=480)

plot(baltSum$year, baltSum$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()
