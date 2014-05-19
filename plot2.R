NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, year=as.factor(year))



### Question 2

NEIBaltimore <- NEI[NEI$fip=="24510",]
png("plot2b.png", width=640, height=640)

   boxplot(Emissions ~ year, data=NEIBaltimore, ylim=c(-0,2))
   title(ylab = expression(PM[2.5]),
         main = expression("Total "*PM[2.5]*" Emission by Year in Baltimore"))

dev.off()
