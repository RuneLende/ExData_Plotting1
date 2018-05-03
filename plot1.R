plot1<- function(){
  ## Does:
  ## 1. reads "household_power_consumption.txt" file
  ## 2. creates a datafrae and uses uses data: 2007-02-01 and 2007-02-02
  ## 3. generate a histogram of global active power(kilowatts)
  
  power <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  rm(power)
  df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  
  hist(df$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())}