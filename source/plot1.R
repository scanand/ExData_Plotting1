#Project1 

library('lubridate')
setwd("d:/ds/p1")

consumption <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",  colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric", "numeric", "numeric", "numeric"))

print(object.size(consumption),units="MB")

extractedData <- subset(consumption, as.Date(Date,"%d/%m/%Y") == as.Date("01/02/2007","%d/%m/%Y")  | as.Date(Date,"%d/%m/%Y")  == as.Date("02/02/2007","%d/%m/%Y")  )

str(consumption)
str(extractedData)

dev.cur()
hist(extractedData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.print(png,file ="plot1.png", width = 480, height = 480)
dev.off()
