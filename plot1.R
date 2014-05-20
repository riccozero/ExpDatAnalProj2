NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, year=as.factor(year))

png("plot1.png", width=640, height=480)

   boxplot(Emissions ~ year, data=NEI, ylim=c(-0,0.75))
   title(ylab = expression(PM[2.5]),
         main = expression("Total "*PM[2.5]*" Emission by Year"))

dev.off()
