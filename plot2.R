data <- read.delim("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
data <- data.frame(data)

dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

dataSubset$Date <- strptime(paste(dataSubset$Date,dataSubset$Time), "%d/%m/%Y %H:%M:%S")

with(dataSubset, {
  plot(Date, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="") 
  lines(Date, Global_active_power)
})

dev.copy(png, file="plot2.png")
dev.off()
