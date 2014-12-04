##Plot 2
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

png(filename = "plot2.png", width = 480, height = 480)

plot(plot_data$Date, plot_data$Global_active_power, xlab= "", ylab = "Global Active Power (kilowats)", type = 'l')

dev.off()