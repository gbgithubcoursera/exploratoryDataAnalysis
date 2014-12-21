#!/bin/env Rscript

NEI <- readRDS("summarySCC_PM25.rds")

#  Create Data
baltimoreData <- subset(NEI, fips == "24510")

baltSum <- aggregate(baltimoreData[c("Emissions")], list(year = baltimoreData$year), sum)

#  Create Plot
png('plot2.png', width=480, height=480)

plot(baltSum$year, baltSum$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")

dev.off()
