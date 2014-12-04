##Plot 1
library(lubridate)

f <- 'household_power_consumption.txt'
data <- read.table(f, header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", 
                                  "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric",
                                  "numeric"))

##Convert Date & Time
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

##Extract data between 2007-02-01 and 2007-02-03
date_from <- ymd('2007-02-01')
date_to   <- ymd('2007-02-03')

png(filename = "plot1.png", width = 480, height = 480)

plot_data <- subset(data, Date >= date_from & Date <= date_to )
hist(plot_data$Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()