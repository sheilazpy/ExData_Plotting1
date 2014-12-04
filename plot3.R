##############################################
# plot3.R -> plot3.png
##############################################
# 1. Get required data
data <- read.table("household_power_consumption.txt",  sep = ";", nrows = 2880, skip = 66637, na.strings = "?", stringsAsFactors = FALSE)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# 2. Draw to png file
date <- as.Date(data$Date, "%d/%m/%Y")
dateTime <- strptime(paste(date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
Sys.setlocale(,"C")#display time in english
plot(dateTime, as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy Submetering")
lines(dateTime, as.numeric(data$Sub_metering_2), type = "l", 	col = "red")
lines(dateTime, as.numeric(data$Sub_metering_3), type = "l", 	col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
			lty = 2, lwd = 2, col = c("black", "red", "blue"))
dev.off()
