#get necessary libraries
library(dplyr)
library(stringr)

#read data into R
powerData <- read.table("household_power_consumption.txt",sep = ";",header = T)


#subset data from correct dates
subsetData <- subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

#create date/time vector
dateTime <- paste(subsetData$Date,subsetData$Time)
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

#create plot matrix
par(mfrow=c(2,2))

#create topright plot
      plot(dateTime, as.numeric(subsetData$Global_active_power),type = 'l',col = 'black',ylab = 'Global Active Power (kilowatts)',xlab = '')
#create topleft plot
      plot(dateTime, as.numeric(subsetData$Voltage),type = 'l',col = 'black',ylab = 'Global Active Power (kilowatts)',xlab = 'datetime')
#create bottomright plot
      plot(dateTime, as.numeric(subsetData$Sub_metering_1),type = 'l',col = 'black',ylab = 'Global Active Power (kilowatts)',xlab = '')
      #add second and third lines
      lines(dateTime, (subsetData$Sub_metering_2), type = "l", col = "red")
      lines(dateTime, (subsetData$Sub_metering_3), type = "l", col = "blue")
      #add legend
      legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black", "red","blue"),lty=1, cex=0.8)
#create bottomleft plot
      plot(dateTime, as.numeric(subsetData$Global_reactive_power),type = 'l',col = 'black',ylab = 'Global Active Power (kilowatts)',xlab = 'datetime')

#copy plot to .png file, then close the device
      dev.copy(png,'plot4.png')
      dev.off()
      