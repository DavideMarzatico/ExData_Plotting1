library("lubridate")

setwd("~/Coursera/Exploratory data analisys/Week1")

data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE)

data$Date <- dmy(data$Date)

data_sub <- subset(data,data$Date==dmy("01/02/2007") | data$Date==dmy("02/02/2007"))

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

data_sub$datetime <- ymd_hms(paste(data_sub$Date, data_sub$Time))

png("plot3.png", width = 480, height = 480)

plot(data_sub$datetime,as.numeric(data_sub$Sub_metering_1), type = "l",xlab = "", ylab = "Energy sub metering")
lines(data_sub$datetime,as.numeric(data_sub$Sub_metering_2),type = "l", col = "red")
lines(data_sub$datetime,as.numeric(data_sub$Sub_metering_3),type = "l", col = "blue")

dev.off()