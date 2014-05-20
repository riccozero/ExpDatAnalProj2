NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# locating all sources related to Coal Combustion

library(stringr)
ind <- !is.na(str_locate(SCC$SCC.Level.One,"Combustion")[,1]) & !is.na(str_locate(SCC$SCC.Level.Three,"Coal")[,1])

CoalCombSource <- SCC[ind,1]

# selecting only readings from Coal Combustion Sources

NEIC <- subset(NEI, SCC %in% CoalCombSource)
NEIC <- transform(NEIC, year=as.factor(year))

png("plot4.png", width=640, height=480)

boxplot(Emissions ~ year, data=NEIC, ylim=c(0,5))
title(ylab = expression(PM[2.5]),
      main = expression("Total "*PM[2.5]*" Emission from Coal Combustion Sources"))

dev.off()

