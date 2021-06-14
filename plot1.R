## Read and subset data
library(lubridate)
dataHead <- read.table("household_power_consumption.txt", sep = ";", nrows = 1)
febData <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", col.names = dataHead, skip = 66637, nrows = 2880)
febData$Date <- dmy(febData$Date)

## Write png of plot
png(file = "plot1.png", width = 480, height = 480)
with(febData, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()