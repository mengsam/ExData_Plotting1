##PLOT2
library(sqldf)
setwd("/Users/mengsam/Documents/R/Explanatory Data Analysis/Project1")
myFile <- "household_power_consumption.txt"
mySQL <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfDATA <- read.csv2.sql(myFile,mySQL)
dateTime <- strptime(paste(dfDATA$Date,dfDATA$Time), 
                     format="%d/%m/%Y %H:%M:%S") ##combine date time
plot(dateTime,dfDATA$Global_active_power,xlab = "",
     ylab = "Global Active Power (kilowatts)",type="n") ##setup graph 
lines(dateTime,dfDATA$Global_active_power) ##draw line graph 
dev.copy(png,file="plot2.png")
dev.off()