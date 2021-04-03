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

#create plot 2
plot(dateTime, as.numeric(subsetData$Global_active_power),type = 'l',col = 'black',ylab = 'Global Active Power (kilowatts)',xlab = '')

#copy plot to .png file, then close the device
dev.copy(png,'plot2.png')
dev.off()