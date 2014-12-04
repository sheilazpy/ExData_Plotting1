##############################################
# plot4.R -> plot4.png
##############################################
# 1. Get data
data <- read.table("household_power_consumption.txt",  sep = ";", nrows = 2880, skip = 66637, na.strings = "?", stringsAsFactors = FALSE)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

date <- as.Date(data$Date, "%d/%m/%Y")
dateTime <- strptime(paste(date, data$Time), "%Y-%m-%d %H:%M:%S")
# 2 Draw four figures to png file
png("plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
Sys.setlocale(, "C")
plot(dateTime, data$Global_active_power, type = "l",	xlab = "",	ylab = "Global Active Power ")
plot(dateTime, data$Voltage,	type = "l",	xlab = "datetime",	ylab = "Voltage")
plot(dateTime, as.numeric(data$Sub_metering_1),	type = "l",	xlab = "", ylab = "Energy Submetering")
lines(dateTime, as.numeric(data$Sub_metering_2), type = "l", col = "red")
lines(dateTime, as.numeric(data$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),	
			lty = 2, lwd = 2,	col = c("black", "red", "blue"))
plot(dateTime, data$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
