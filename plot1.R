NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, year=as.factor(year))
png("plot1.png", width=640, height=640)

   boxplot(Emissions ~ year, data=NEI, ylim=c(-0.5,1))
   title(ylab = expression(PM[2.5]),
         main = expression("Total "*PM[2.5]*" Emission by Year"))

dev.off()
