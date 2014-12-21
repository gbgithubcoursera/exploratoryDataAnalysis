#!/bin/env Rscript

suppressMessages(library(ggplot2))

#  Read Data from the serialized object
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Data 
BC <- subset(NEI, fips == "24510") 
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)

#  Create Plot
png('plot3.png', width=480, height=480)
p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
     geom_point(alpha=.3) +
     #geom_smooth(alpha=.2, size=1, method="loess") +
     #geom_line(colour="red", linetype="dotted", size=1.5) +
     geom_line() +
     ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()

warnings()
