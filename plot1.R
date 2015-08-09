library(data.table)

d <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

d.sub <- subset(d, Date == "1/2/2007" | Date == "2/2/2007")

hist(as.numeric(d.sub$Global_active_power), col = "orangered",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, "plot1.png")
dev.off()
