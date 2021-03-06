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


png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

plot(datedata$Global_active_power, 
     type="l", 
     main="Global Active Power", 
     col='red', 
     ylab= "Frequency", 
     xlab="Global Active Power (kilowatts)")

plot(datedata$Datetime, 
     datedata$Sub_metering_1, 
     type="l", 
     ylab= "Energy sub metering",
     xlab="")

lines(datedata$Datetime, 
      datedata$Sub_metering_2, 
      type="l", 
      col="red")


lines(datedata$Datetime, 
      datedata$Sub_metering_3, 
      type="l", 
      col="blue")

legend("topright", 
       c("Sub_metering_1", 
         "Sub_metering_2", 
         "Sub_metering_3"), 
       lty=1, 
       col=c("black", 
             "red", 
             "blue"))

plot(datedata$Datetime,
     datedata$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

plot(datedata$Datetime,
     datedata$Global_reactive_power,
     type='l',
     xlab="datetime",
     ylab="Global_reactive_power")


dev.off()