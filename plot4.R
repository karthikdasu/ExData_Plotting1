data <- read.delim("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
data <- data.frame(data)

dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

dataSubset$Date <- strptime(paste(dataSubset$Date,dataSubset$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")

par(mfrow=c(2,2), mar=c(4,4,2,1))

with(dataSubset, {
  plot(Date, Global_active_power, type="n", ylab="Global Active Power", xlab="") 
  lines(Date, Global_active_power)
})

with(dataSubset, {
  plot(Date, Voltage, type="n", ylab="Voltage", xlab="datetime") 
  lines(Date, Voltage)
})

with(dataSubset, {
  plot(Date, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="") 
  lines(Date, Sub_metering_1)
  lines(Date, Sub_metering_2, col="red")
  lines(Date, Sub_metering_3, col="blue")
  legend("topright", bty="n", lwd=0.5, cex= 0.5, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

with(dataSubset, {
  plot(Date, Global_reactive_power, type="n", xlab="datetime") 
  lines(Date, Global_reactive_power)
})

dev.off()

