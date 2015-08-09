library(data.table)

datasets <- fread("household_power_consumption.txt", header = TRUE,
           colClasses = "character", na.strings = "?", sep = ";")

datasets.sub <- datasets[Date == "1/2/2007" | Date == "2/2/2007", ]

hist(as.numeric(datasets.sub$Global_active_power), col = "orangered",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, "plot1.png")
dev.off()
