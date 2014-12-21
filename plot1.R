#!/usr/bin/env Rscript

# Read Data from the serialized object 
NEI <- readRDS("summarySCC_PM25.rds")

# Find total Emmision per Year 
sumPerYear <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

# Open PNG device to Plot to
png('plot1.png', width=480, height=480)

plot(sumPerYear$year, sumPerYear$Emissions/1000000, type = "l",
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions in Millions")

dev.off()
