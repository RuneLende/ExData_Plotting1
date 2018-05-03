## PLOT 2 OVERVIEW

plot3 <- function() {
  power <- read.table(file="household_power_consumption.txt", header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(df$timestamp,df$Sub_metering_1, col= "black", type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2, col= "red", type="l")
  lines(df$timestamp,df$Sub_metering_3, col= "blue", type="l")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png saved in", getwd())
}