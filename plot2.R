# load data...
dataFile <- "../household_power_consumption.txt";
data <- read.table(dataFile, na.strings = "?", sep = ";", header = TRUE)

## create new column for a combined date and time object
data$dateTime <- paste(data$Date, data$Time, sep = " ")
data$dateTime <- strptime(data$dateTime, format="%d/%m/%Y %H:%M:%S")

# subset frame to just include 2/1/2007 and 2/2/2007...
sub <- subset(data, dateTime > strptime("2007/1/31 24:00:00", format = "%Y/%m/%d %H:%M:%S") & dateTime < strptime("2007/2/3 00:00:00", format = "%Y/%m/%d %H:%M:%S"))

# create plot as png...
png("plot2.png", width = 480, height = 480)
plot(sub$dateTime, sub$Global_active_power, col="black", ylab = "Global Active Power (kilowatts)", xlab="",  main = "", type="n")
lines(sub$dateTime, sub$Global_active_power, type="l", col="black")
dev.off()