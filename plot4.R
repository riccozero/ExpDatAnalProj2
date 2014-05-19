NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# locating all sources related to Coal Combustion

library(stringr)
ind <- !is.na(str_locate(SCC$SCC.Level.One,"Combustion")[,1]) & !is.na(str_locate(SCC$SCC.Level.Three,"Coal")[,1])

CoalCombSource <- SCC[ind,]

# CoalCombSource <- transform(CoalCombSource, SCC = as.numeric(SCC))

IsCoalCombSource <- function(x,z){
    y <- rep(FALSE, length(x))
    for (i in z){y <- y | (x==i)}
    y
}

indx <- IsCoalCombSource(NEI$SCC,CoalCombSource$SCC)

NEIC <- NEI[indx,]

NEIC <- transform(NEIC, year=as.factor(year))



png("plot4.png", width=640, height=640)

boxplot(Emissions ~ year, data=NEIC, ylim=c(0,5))
title(ylab = expression(PM[2.5]),
      main = expression("Total "*PM[2.5]*" Emission from Coal Combustion Sources"))

dev.off()

