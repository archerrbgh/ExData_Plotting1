#Load and preprocess data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
subdata[,3] <- as.numeric(as.character(subdata[,3]))
subdata$DateTime <- paste(subdata$Date, subdata$Time)
subdata$DateTime <- strptime(subdata$DateTime, "%Y-%m-%d %H:%M:%S")

#Generate plot
png("plot2.png", height = 480, width = 480, bg = "white")
plot(subdata[,10], subdata[,3], type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()