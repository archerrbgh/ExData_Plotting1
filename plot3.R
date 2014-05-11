#Load and preprocess data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, "%Y-%m-%d %H:%M:%S")
subdata[,7] <- as.numeric(as.character(subdata[,7]))
subdata[,8] <- as.numeric(as.character(subdata[,8]))
subdata[,9] <- as.numeric(as.character(subdata[,9]))

#Generate plot
png("plot3.png", height = 480, width = 480, bg = "white")
plot(subdata[,10], subdata[,7], type = "l", xlab = "", ylab = "Energy sub metering")
lines(subdata[,10], subdata[,8], col = "red")
lines(subdata[,10], subdata[,9], col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()