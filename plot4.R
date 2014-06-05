plot4 <- function() {
## Open file for plot  
  png(file = "plot4.png")
## Read data table, only first 100000 rows to save time
  x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", nrows = 100000)
## Extract dates to plot
  y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
## Combine date and time in one column and then convert to R time format
  y$Date <- paste(y$Date,y$Time)
  y$Date <- strptime(as.character(y$Date),format="%d/%m/%Y %H:%M:%S")
## Plot 4 graphs per page filling row-wise
  par(mfrow= c(2,2))
## Plot for Global Active Power
  with(y, plot(Date, Global_active_power, type = "l", 
               ylab = "Global Active Power", xlab = ""))
## Plot for Voltage
  with(y, plot(Date, Voltage, type = "l", 
               ylab = "Voltage", xlab = "datetime"))
## Plot first line for sub metering 1
  with(y, plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
## Add plots for Sub metering 2 and 3
  with(y, lines(Date, Sub_metering_2, type = "l", col = "red"))
  with(y, lines(Date, Sub_metering_3, type = "l", col = "blue"))
## Add legend 
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, col = c("black", "red", "blue"), bty = "n")
## Plot for Global reactive power
  with(y, plot(Date, Global_reactive_power, type = "l", 
               ylab = "Global_reactive_power", xlab = "datetime"))
##  Close file
  dev.off()
}