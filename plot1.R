##PLOT1
library(sqldf)
setwd("/Users/mengsam/Documents/R/Explanatory Data Analysis/Project1")
myFile <- "household_power_consumption.txt"
mySQL <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfDATA <- read.csv2.sql(myFile,mySQL)
hist(dfDATA$Global_active_power,xlab = "Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power",col = "red")
dev.copy(png,file="plot1.png")
dev.off()
