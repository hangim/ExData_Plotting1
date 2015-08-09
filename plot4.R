library(data.table)

datasets <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

datasets.sub <- datasets[Date == "1/2/2007" | Date == "2/2/2007", ]

datetime <- strptime(paste(datasets.sub$Date, datasets.sub$Time),
                     "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2, 2))

# top left
plot(datetime, datasets.sub$Global_active_power, type = "line", xlab = "",
     ylab = "Global Active Power")

# top right
plot(datetime, datasets.sub$Voltage, type = "line", ylab = "Voltage")

# bottom left
plot(datetime, datasets.sub$Sub_metering_1, type = "line", xlab = "",
     ylab = "Energy sub metering")
lines(datetime, datasets.sub$Sub_metering_2, col = "red")
lines(datetime, datasets.sub$Sub_metering_3, col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottom right
plot(datetime, datasets.sub$Global_reactive_power, type = "line",
     ylab = "Global Reactive Power")

dev.copy(png, "plot4.png")
dev.off()
