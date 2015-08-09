library(data.table)

datasets <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

datasets.sub <- datasets[Date == "1/2/2007" | Date == "2/2/2007", ]

datetime <- strptime(paste(datasets.sub$Date, datasets.sub$Time), "%d/%m/%Y %H:%M:%S")

plot(datetime, datasets.sub$Global_active_power, type = "line", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
