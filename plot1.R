#Set working directory and read in data set
setwd("/Users/mchan/desktop/coursera")
consumption <- read.table("household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

#Reformat Date & subset to the desired date range
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption_subset <- consumption[consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02",]

#set PNG file
png("plot1.png", width = 480, height = 480)
hist(consumption_subset$Global_active_power, col= "Red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")

## shuts down device
dev.off()

