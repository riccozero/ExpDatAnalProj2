NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, logEmissions=log10(Emissions), 
                 year=as.factor(year),
                 type=as.factor(type))
NEIBaltimore <- NEI[NEI$fip=="24510",]


### Question 3

library(ggplot2)

plt3 <- ggplot(NEIBaltimore, aes(year, logEmissions))
plt3 <- plt3 + facet_grid(.~type) + geom_boxplot() 
plt3 <- plt3 + labs(title = expression("Total "*PM[2.5]*" Emission by Year in Baltimore"),
                    y = expression(log[10]*" "*PM[2.5]))
png("plot3.png",width=640,height=480)
   print(plt3)
dev.off()
