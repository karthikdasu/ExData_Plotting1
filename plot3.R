data <- read.delim("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
data <- data.frame(data)

dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

dataSubset$Date <- strptime(paste(dataSubset$Date,dataSubset$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
with(dataSubset, {
  plot(Date, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="") 
  lines(Date, Sub_metering_1)
  lines(Date, Sub_metering_2, col="red")
  lines(Date, Sub_metering_3, col="blue")
  legend("topright", lwd=0.5, cex=0.75, lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

dev.off()
