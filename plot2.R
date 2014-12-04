##############################################
# plot2.R -> plot2.png
##############################################
# 1. Get required data from the text file
data <- read.table("household_power_consumption.txt",  sep = ";", nrows = 2880, skip = 66637, na.strings = "?", stringsAsFactors = FALSE)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# 2. Draw to png file
date <- as.Date(data$Date, "%d/%m/%Y")
dateTime <- strptime(paste(date, data$Time), "%Y-%m-%d %H:%M:%S")
gap <- as.numeric(data$Global_active_power)

png("plot2.png", width = 480, height = 480)
Sys.setlocale(,"C")#display time in english
plot(dateTime, gap, type = "l", xlab = "", 	ylab = "Global Active Power (kilowatts)")
dev.off()
