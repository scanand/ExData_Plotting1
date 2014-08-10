#Project1 - Plot2

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

plot(extractedData$day,extractedData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.print(png,file ="plot2.png", width = 480, height = 480,units="px")
dev.off()
