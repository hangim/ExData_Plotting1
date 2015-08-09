library(data.table)

d <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

d.sub <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

a <- strptime(paste(d.sub$Date, d.sub$Time), "%d/%m/%Y %H:%M:%S")

plot(a, d.sub$Sub_metering_1, type = "line", xlab = "",
     ylab = "Energy sub metering")
lines(a, d.sub$Sub_metering_2, col = "red")
lines(a, d.sub$Sub_metering_3, col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()
