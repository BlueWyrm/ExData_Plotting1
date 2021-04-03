#get necessary libraries
library(dplyr)
library(stringr)

#read data into R
powerData <- read.table("household_power_consumption.txt",sep = ";",header = T)



#subset data from correct dates
subsetData <- subset(powerData, Date %in% c("1/2/2007","2/2/2007"))

#create plot 1
hist(as.numeric(subsetData$Global_active_power), col = 'red', xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', main = 'Global Active Power')

#copy plot to .png file, then close the device
dev.copy(png,'plot1.png')
dev.off()