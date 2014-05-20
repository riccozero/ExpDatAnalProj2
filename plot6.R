NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# locating all sources related to Vehicular Traffic

library(stringr)
MV <- SCC[!is.na(str_locate(SCC$SCC.Level.Two,"Highway Vehicle")[,1]),1]


# locating all readings from Baltimore and LA County from MV

NEIBaltimore <- subset(NEI, fips=="24510" & SCC %in% MV)
NEIBaltimore <- transform(NEIBaltimore, fips="Baltimore", year=as.factor(year))

NEILA <- subset(NEI, fips=="06037" & SCC %in% MV)
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

