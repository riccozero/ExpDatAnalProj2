NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- NEI[NEI$fips==24510,]

# locating all sources related to Coal Combustion

library(stringr)
ind <- !is.na(str_locate(SCC$SCC.Level.Two,"Highway Vehicle")[,1])

MV <- SCC[ind,]

IsMV <- function(x,z){
    y <- rep(FALSE, length(x))
    for (i in z){y <- y | (x==i)}
    y
}




indx <- IsMV(NEIBaltimore$SCC,MV$SCC)

NEIBaltimore <- NEIBaltimore[indx,]

NEIBaltimore <- transform(NEIBaltimore, year=as.factor(year))



png("plot5.png", width=640, height=480)

boxplot(Emissions ~ year, data=NEIBaltimore, ylim=c(0,2))
title(ylab = expression(PM[2.5]),
      main = expression("Total "*PM[2.5]*" Emission from Motor Vehicles"))

dev.off()

