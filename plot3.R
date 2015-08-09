library(data.table)

datasets <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

datasets.sub <- datasets[Date == "1/2/2007" | Date == "2/2/2007", ]

datetime <- strptime(paste(datasets.sub$Date, datasets.sub$Time), "%d/%m/%Y %H:%M:%S")

plot(datetime, datasets.sub$Sub_metering_1, type = "line", xlab = "",
     ylab = "Energy sub metering")
lines(datetime, datasets.sub$Sub_metering_2, col = "red")
lines(datetime, datasets.sub$Sub_metering_3, col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()
