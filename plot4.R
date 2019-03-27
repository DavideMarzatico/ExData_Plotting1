library("lubridate")

setwd("~/Coursera/Exploratory data analisys/Week1")

data <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE)

data$Date <- dmy(data$Date)

data_sub <- subset(data,data$Date==dmy("01/02/2007") | data$Date==dmy("02/02/2007"))

data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)

data_sub$datetime <- ymd_hms(paste(data_sub$Date, data_sub$Time))

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))   
                plot(data_sub$datetime,data_sub$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
                plot(data_sub$datetime,as.numeric(data_sub$Voltage), type = "l",xlab = "datetime", ylab = "Voltage")
  
                plot(data_sub$datetime,as.numeric(data_sub$Sub_metering_1), type = "l",xlab = "", ylab = "Energy sub metering")
                lines(data_sub$datetime,as.numeric(data_sub$Sub_metering_2),type = "l", col = "red")
                lines(data_sub$datetime,as.numeric(data_sub$Sub_metering_3),type = "l", col = "blue")

                plot(data_sub$datetime,data_sub$Global_reactive_power, type = "l",xlab = "", ylab = "Global_reactive_power")

dev.off()