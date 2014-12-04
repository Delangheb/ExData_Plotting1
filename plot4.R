##Plot 4
library(lubridate)

f    <- 'household_power_consumption.txt'
data <- read.table(f, header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", 
                                  "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric",
                                  "numeric"))

##Convert Date & Time
##data$Date <- dmy_hms(data$Date + data$Time)
##data$Time <- hms(data$Time)
data$Date <- dmy_hms(paste(data$Date, data$Time, sep=" "))

##Extract data between 2007-02-01 and 2007-02-03
date_from <- ymd('2007-02-01')
date_to   <- ymd('2007-02-03')

plot_data <- subset(data, Date >= date_from & Date <= date_to )

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(plot_data$Date, plot_data$Global_active_power, xlab ="", ylab = "Global Active Power", type = "l")

plot(plot_data$Date, plot_data$Voltage, xlab= "datetime", ylab = "Voltage", type = 'l')

plot(plot_data$Date, plot_data$Sub_metering_1, ylim = c(0,40), xlab= "", ylab = "Energy Submetering", type = 'l')
par(new=TRUE)
plot(plot_data$Date, plot_data$Sub_metering_2, ylim = c(0,40), xlab= "", ylab = "Energy Submetering", type = 'l', col = "red")
par(new=TRUE)
plot(plot_data$Date, plot_data$Sub_metering_3, ylim = c(0,40), xlab= "", ylab = "Energy Submetering", type = 'l', col = "blue")
legend('topright', 'groups', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = c(1,2,3), col =c('black', 'red', 'blue'), bty ="n", ncol=1)

plot(plot_data$Date, plot_data$Global_reactive_power, xlab ="datetime", ylab = "Global Reactive Power", type = "l")

par(mfrow = c(1,1))

dev.off()
