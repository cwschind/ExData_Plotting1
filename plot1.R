plot1 <- function() {
  
## Open file to save graph  
  png(file = "plot1.png")
  
## Read the data table  
  x <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?", nrows = 100000)
## Choose the two dates for graphing  
  y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
## Set the Date column to include both date and time and convert to R time format
  y$Date <- paste(y$Date,y$Time)
  y$Date <- strptime(as.character(y$Date),format="%d/%m/%Y %H:%M:%S")
## Make the histogram with appropriate labels and color
  with(y, hist(Global_active_power, main = "Global Active Power", 
               xlab = "Global Active Power (killowatts)", col = "red"))
## Close file
  dev.off()

}