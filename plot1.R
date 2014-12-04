##############################################
# plot1.R -> plot1.png
##############################################
# 1. Get required data from the text file
data <- read.table("household_power_consumption.txt",  sep = ";", nrows = 2880, skip = 66637, na.strings = "?", stringsAsFactors = FALSE)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
# 2. Draw histogram to png file 
png("plot1.png", width = 480, height = 480)
gap <- data$Global_active_power
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
