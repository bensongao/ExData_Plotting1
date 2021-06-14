## Read and subset data
library(lubridate)
dataHead <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
febData <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", col.names = dataHead, skip = 66637, nrows = 2880)
febData$Date <- dmy(febData$Date)
febData$DateTime <- ymd_hms(paste(febData$Date, febData$Time))

## Write png of plot
png(file = "plot3.png", width = 480, height = 480)
with(febData, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
with(febData, lines(DateTime, Sub_metering_2, col = "red"))
with(febData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
