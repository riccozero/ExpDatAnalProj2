NEI <- readRDS("summarySCC_PM25.rds")
NEI <- transform(NEI, logEmissions=log10(Emissions), year=as.factor(year))


### Question 1

# png("plot1.png", width=640, height=640)
#
#   boxplot(logEmissions ~ year, data=NEI, ylim=c(-7.5,5))
#   title(ylab = expression(log[10]*" "*PM[2.5]),
#         main = expression("Total "*PM[2.5]*" Emission by Year"))
#
# dev.off()

### Question 2

NEIBaltimore <- NEI[NEI$fip=="24510",]
png("plot2.png", width=640, height=640)

   boxplot(logEmissions ~ year, data=NEIBaltimore, ylim=c(-7.5,5))
   title(ylab = expression(log[10]*" "*PM[2.5]),
         main = expression("Total "*PM[2.5]*" Emission by Year in Baltimore"))

dev.off()
