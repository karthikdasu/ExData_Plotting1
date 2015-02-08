data <- read.delim("household_power_consumption.txt", header= TRUE, sep=";", na.strings="?")
data <- data.frame(data)

dataSubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

with(dataSubset, {
      hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red") 
})

dev.copy(png, file="plot1.png")
dev.off()


