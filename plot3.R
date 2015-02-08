#Set working directory and read in data set
setwd("/Users/mchan/desktop/coursera")
consumption <- read.table("household_power_consumption.txt", header = T, sep = ";", colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

#Reformat Date, subset to the desired date range, and create datetime field
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption_subset <- consumption[consumption$Date=="2007-02-01" | consumption$Date=="2007-02-02",]
DateTime <- paste(as.Date(consumption_subset$Date), consumption_subset$Time)
consumption_subset$DateTime <- as.POSIXct(DateTime)

#set PNG file
png("plot3.png", width = 480, height = 480)

#Plot3: Energy Sub Metering
plot(consumption_subset$DateTime,consumption_subset$Sub_metering_1,type="l",  ylab = "Energy Sub Metering", xlab="")
lines(consumption_subset$DateTime,consumption_subset$Sub_metering_2,type="l",col="red")
lines(consumption_subset$DateTime,consumption_subset$Sub_metering_3,type="l",col="blue")

#Apply legend to plot3
legend("topright", 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lwd = .9, 
       cex = .9
)

## shuts down device
dev.off()

