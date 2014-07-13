##PLOT4
library(sqldf)
setwd("/Users/mengsam/Documents/R/Explanatory Data Analysis/Project1")
myFile <- "household_power_consumption.txt"
mySQL <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
dfDATA <- read.csv2.sql(myFile,mySQL)
dateTime <- strptime(paste(dfDATA$Date,dfDATA$Time), 
                     format="%d/%m/%Y %H:%M:%S") ##combine date time

par(mfrow = c(2,2)) 

## Global Active Power
plot(dateTime,dfDATA$Global_active_power,xlab = "",
     ylab = "Global Active Power",cex.lab=0.7,cex.axis=0.7,type="n")  
lines(dateTime,dfDATA$Global_active_power) 

## Voltage
plot(dateTime,dfDATA$Voltage,xlab="datetime",ylab="Voltage",cex.lab=0.6,cex.axis=0.7,type="n")
lines(dateTime,dfDATA$Voltage)

##Sub metering 
plot(dateTime,dfDATA$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",
     cex.lab=0.7,cex.axis=0.7) ##setup graph
lines(dateTime,dfDATA$Sub_metering_1)
lines(dateTime,dfDATA$Sub_metering_2,col="red")
lines(dateTime,dfDATA$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,bty="n")

## Global reactive power
plot(dateTime,dfDATA$Global_reactive_power,type="n",xlab="datetime",
     ylab="Global_reactive_power",cex.lab=0.7,cex.axis=0.7)
lines(dateTime,dfDATA$Global_reactive_power)

dev.copy(png,file="plot4.png")
dev.off()