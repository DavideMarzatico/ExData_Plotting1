library("lubridate")

setwd("~/Coursera/Exploratory data analisys/Week1")

data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE)

data$Date <- dmy(data$Date)

data_sub <- subset(data,data$Date==dmy("01/02/2007") | data$Date==dmy("02/02/2007"))

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

png("plot1.png", width = 480, height = 480)


hist(as.numeric(data_sub$Global_active_power),col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatt)")

dev.off()