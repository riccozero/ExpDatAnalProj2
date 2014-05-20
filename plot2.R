NEI <- readRDS("summarySCC_PM25.rds")

### Question 2

NEIBaltimore <- subset(NEI, fips=="24510")

NEIBaltimore <- transform(NEIBaltimore, year=as.factor(year))

png("plot2.png", width=640, height=480)

   boxplot(Emissions ~ year, data=NEIBaltimore, ylim=c(0,2))
   title(ylab = expression(PM[2.5]),
         main = expression("Total "*PM[2.5]*" Emission by Year in Baltimore"))

dev.off()
