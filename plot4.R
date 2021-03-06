# load data...
dataFile <- "../household_power_consumption.txt";
data <- read.table(dataFile, na.strings = "?", sep = ";", header = TRUE)

## create new column for a combined date and time object
data$dateTime <- paste(data$Date, data$Time, sep = " ")
data$dateTime <- strptime(data$dateTime, format="%d/%m/%Y %H:%M:%S")

# subset frame to just include 2/1/2007 and 2/2/2007...
sub <- subset(data, dateTime > strptime("2007/1/31 24:00:00", format = "%Y/%m/%d %H:%M:%S") & dateTime < strptime("2007/2/3 00:00:00", format = "%Y/%m/%d %H:%M:%S"))

# create plot as png...
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(sub$dateTime, 
     { 
        plot(sub$dateTime, sub$Global_active_power, col="black", ylab = "Global Active Power", xlab="",  main = "", type="n")
        lines(sub$dateTime, sub$Global_active_power, type="l", col="black")
        
        plot(sub$dateTime, sub$Voltage, col="black", ylab = "Voltage", xlab="datetime",  main = "", type="n")
        lines(sub$dateTime, sub$Voltage, type="l", col="black") 

        plot(sub$dateTime, sub$Global_active_power, col="black", ylim=c(0,38), ylab = "Energy sub metering", xlab="",  main = "", type="n")
        lines(sub$dateTime, sub$Sub_metering_1, type="l", col="black")
        lines(sub$dateTime, sub$Sub_metering_2, type="l", col="red")
        lines(sub$dateTime, sub$Sub_metering_3, type="l", col="blue")
        legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),  lty = c(1, 1, 1))
        
        plot(sub$dateTime, sub$Global_reactive_power, col="black", ylab = "Global_reactive_power", xlab="datetime",  main = "", type="n")
        lines(sub$dateTime,  sub$Global_reactive_power, type="l", col="black") 
        
    } )
dev.off()