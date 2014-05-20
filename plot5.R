NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- subset(NEI, fips==24510)

# locating all sources related to Vehicular Traffic

library(stringr)
MV <- SCC[!is.na(str_locate(SCC$SCC.Level.Two,"Highway Vehicle")[,1]),1]

NEIBaltimore <- subset(NEIBaltimore, SCC %in% MV)
NEIBaltimore <- transform(NEIBaltimore, year=as.factor(year))



png("plot5.png", width=640, height=480)

boxplot(Emissions ~ year, data=NEIBaltimore, ylim=c(0,2))
title(ylab = expression(PM[2.5]),
      main = expression("Total "*PM[2.5]*" Emission from Motor Vehicles"))

dev.off()

