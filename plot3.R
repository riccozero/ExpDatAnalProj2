NEI <- readRDS("summarySCC_PM25.rds")

NEIBaltimore <- subset(NEI,fips=="24510")
NEIBaltimore <- transform(NEIBaltimore,  
                 year=as.factor(year),
                 type=as.factor(type))


### Question 3

library(ggplot2)

plt3 <- ggplot(NEIBaltimore, aes(year, Emissions))
plt3 <- plt3 + facet_grid(.~type) + geom_boxplot() 
plt3 <- plt3 + labs(title = expression("Total "*PM[2.5]*" Emission by Year in Baltimore"),
                    y = expression(PM[2.5]))
plt3 <- plt3 + coord_cartesian(ylim=c(0,15))
png("plot3.png",width=640,height=480)
   print(plt3)
dev.off()
