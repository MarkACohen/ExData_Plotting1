dataFile <- "../household_power_consumption.txt";
data <- read.table(dataFile, na.strings = "?", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
sub <- subset(data, Date == as.Date("2007/2/1", format = "%Y/%m/%d") | Date == as.Date("2007/2/2", format = "%Y/%m/%d"))
png("plot1.png", width = 480, height = 480)
hist(sub$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Golbal Active Power")
dev.off()