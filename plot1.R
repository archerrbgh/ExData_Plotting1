#Load and preprocess data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subdata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
subdata[,3] <- as.numeric(as.character(subdata[,3]))

#Generate histogram
png("plot1.png", bg = "white", height = 480, width = 480)
hist(subdata[,3], main = "Global Active Power", xlab = "Global Active Power (in kilowatts)", col = "red")
dev.off()