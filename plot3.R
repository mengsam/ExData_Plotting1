##PLOT3
library(sqldf)
setwd("/Users/mengsam/Documents/R/Explanatory Data Analysis/Project1")
myFile <- "household_power_consumption.txt"
mySQL <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfDATA <- read.csv2.sql(myFile,mySQL)
dateTime <- strptime(paste(dfDATA$Date,dfDATA$Time), 
                     format="%d/%m/%Y %H:%M:%S") ##combine date time
plot(dateTime,dfDATA$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",
     cex.lab=0.7,cex.axis=0.7) ##setup graph
lines(dateTime,dfDATA$Sub_metering_1)
lines(dateTime,dfDATA$Sub_metering_2,col="red")
lines(dateTime,dfDATA$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.7)
##legend labeling 
dev.copy(png,file="plot3.png")
dev.off()