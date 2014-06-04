plot1 <- function() {
  png(file = "plot1.png")
  x <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 100000)
  y <- subset(x, Date == "1/2/2007" | Date == "2/2/2007")
  y$Date <- paste(y$Date,y$Time)
  y$Date <- strptime(as.character(y$Date),format="%d/%m/%Y %H:%M:%S")
  with(y, hist(Global_active_power, main = "Global Active Power", 
               xlab = "Global Active Power (killowatts)", col = "red"))
  ##dev.copy(png, file = "plot1.png")
  dev.off()
  ##print(head(y))
  ##print(tail(y))
}