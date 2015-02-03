rm(list=ls())

datatable<-read.table("household_power_consumption.txt", 
                      sep=";",
                      nrows= 2075260, 
                      header=TRUE, 
                      quote= "", 
                      strip.white=TRUE, 
                      stringsAsFactors = FALSE, 
                      na.strings= "?")

datedata<-subset(datatable, (datatable$Date == "1/2/2007" | datatable$Date== "2/2/2007")) 

datedata$Date <- as.Date(datedata$Date, format = "%d/%m/%Y")

datedata$Datetime <- as.POSIXct(paste(datedata$Date, datedata$Time))


png("plot2.png", width = 480, height = 480)

plot(datedata$Datetime, 
     datedata$Global_active_power, 
     type="l", 
     ylab= "Global Active Power (kilowatts)",
     xlab="")



dev.off()