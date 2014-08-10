#Project1 - Plot4
#Date 1108

library('lubridate')
setwd("d:/ds/p1")

consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",  colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric"))

print(object.size(consumption),units="MB")

extractedData <- subset(consumption, as.Date(Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y")  | as.Date(Date,"%d/%m/%Y")  == as.Date("02/02/2007","%d/%m/%Y")  )
str(consumption)
str(extractedData)

x <- paste(extractedData$Date, extractedData$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
class(x)
extractedData$day <- x

dev.cur()
par(mfrow = c(2,2))
par("mar")
# par(mar =c(2,2,1,1))

plot(extractedData$day,extractedData$Global_active_power,type="l",xlab="",ylab="Global Active Power" )
plot(extractedData$day,extractedData$Voltage,type="l",ylab="Voltage" ,xlab="datetime")

plot(extractedData$day,extractedData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(extractedData$day,extractedData$Sub_metering_1,col="black")
lines(extractedData$day,extractedData$Sub_metering_2,col="red")
lines(extractedData$day,extractedData$Sub_metering_3,col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),      # Legend labels  
       col=c("black", "red", "blue"),   # Color of points or lines  
       pch=c(NA,NA,NA),                 # Point type  
       lty=c(1,1,1),                    # Line type  
       lwd=c(1,1,1)                    # Line width  
)
plot(extractedData$day,extractedData$Global_reactive_power,type="l",xlab="datetime" ,ylab="Global_reactive_power")

dev.print(png,file ="plot4.png", width = 480, height = 480)
dev.off()
