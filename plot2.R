#Set working directory and read in data set
setwd("/Users/mchan/desktop/coursera")
consumption <- read.table("household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

#Reformat Date, subset to the desired date range, and create datetime field
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption_subset <- consumption[consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02",]
DateTime <- paste(as.Date(consumption_subset$Date), consumption_subset$Time)
consumption_subset$DateTime <- as.POSIXct(DateTime)

#set PNG file
png("plot2.png", width = 480, height = 480)

#Plot2: Glocal Active Power
plot( consumption_subset$DateTime,consumption_subset$Global_active_power, type="l",  ylab = "Global Active Power (kilowatts)", xlab="")

## shuts down device
dev.off()

