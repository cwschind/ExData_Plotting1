plot2 <- function() {
## Open file for plot  
  png(file = "plot2.png")
## Read data table, first 100000 rows to save time
  x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?", nrows = 100000)
## Extract data for the two date to plot
  y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
## Combine date and time and then convert to R time format
  y$Date <- paste(y$Date,y$Time)
  y$Date <- strptime(as.character(y$Date),format="%d/%m/%Y %H:%M:%S")
## Plot data
  with(y, plot(Date, Global_active_power, type = "l", 
               ylab = "Global Active Power (kilowatts)", xlab = ""))
## Close file
  dev.off()
}