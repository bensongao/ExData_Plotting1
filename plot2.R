## Read and subset data
library(lubridate)
dataHead <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
febData <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", col.names = dataHead, skip = 66637, nrows = 2880)
febData$Date <- dmy(febData$Date)
febData$DateTime <- ymd_hms(paste(febData$Date, febData$Time))

## Write png of plot
png(file = "plot2.png", width = 480, height = 480)
with(febData, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()
