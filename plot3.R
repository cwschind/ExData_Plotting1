plot3 <- function() {
## Open file for plot  
  png(file = "plot3.png")
## Read data table, only first 100000 rows to save time
  x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", nrows = 100000)
## Extract dates to plot
  y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
## Combine date and time in one column and then convert to R time format
  y$Date <- paste(y$Date,y$Time)
  y$Date <- strptime(as.character(y$Date),format="%d/%m/%Y %H:%M:%S")
## Plot first line for sub metering 1
  with(y, plot(Date, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
## Add plots for Sub metering 2 and 3
  with(y, points(Date, Sub_metering_2, type = "l", col = "red"))
  with(y, points(Date, Sub_metering_3, type = "l", col = "blue"))
## Add legend 
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = 1, col = c("black", "red", "blue"))
## Close file
  dev.off()
}