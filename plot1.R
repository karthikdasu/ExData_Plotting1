data <- read.delim("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
data <- data.frame(data)

dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

png(filename = "plot1.png", width=480, height=480)

with(dataSubset, {
      hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
})

dev.off()


