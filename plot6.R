NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIBaltimore <- NEI[NEI$fips=="24510",]

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

NEIBaltimore <- transform(NEIBaltimore, fips="Baltimore", year=as.factor(year))




NEILA <- NEI[NEI$fips=="06037",]
indx <- IsMV(NEILA$SCC,MV$SCC)
NEILA <- NEILA[indx,]
NEILA <- transform(NEILA, fips="Los Angeles County", year=as.factor(year))

NEIComb <- rbind(NEIBaltimore, NEILA)



library(ggplot2)
plt6 <- ggplot(NEIComb, aes(year, Emissions))
plt6 <- plt6 + facet_grid(.~fips) + geom_boxplot() 
plt6 <- plt6 + labs(title = expression("Total "*PM[2.5]*" Motor Vehicle Emission by Year"),
                    y = expression(PM[2.5]))
plt6 <- plt6 + coord_cartesian(ylim=c(0,15))

png("plot6.png", width=640, height=480)
print(plt6)
dev.off()

