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

datedata$Date <- as.Date(datedata$Date,
                         format = "%d/%m/%Y")

png("plot1.png", width = 480, height = 480)

hist(datedata$Global_active_power, 
     type="l", 
     main="Global Active Power", 
     col='red', 
     ylab= "Frequency", 
     xlab="Global Active Power (kilowatts)")


dev.off()