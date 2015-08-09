library(data.table)

d <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

d.sub <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

a <- strptime(paste(d.sub$Date, d.sub$Time), "%d/%m/%Y %H:%M:%S")
b <- d.sub$Global_active_power

plot(a, b, type = "line", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
