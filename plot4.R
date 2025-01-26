##mev For plot4.png

file <- "household_power_consumption.txt"
rawdata <- read.table(file, sep = ";", skip = 66637, nrows = 2880)

##mev Combine and convert dates and times
datetime <- strptime(paste(rawdata$V1,rawdata$V2), "%d/%m/%Y %H:%M:%S")

##mev Combine columns and add column names for plot4
p4d <- data.frame(datetime, rawdata[,3:5], rawdata[7:9])
names(p4d) <- c("DT", "GAP", "GRP", "volt", "one", "two", "thr")

par(mfrow = c(2,2))

##mev Line plot w/ y-axis label and blank x-axis
with(p4d, {
  plot(DT, GAP, type = "l", 
          ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")

    axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
       labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)
  
  
  plot(DT, volt, type = "l", 
       ylab = "Voltage", xlab = "", xaxt = "n")
  
    axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
       labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)
  
  
  plot(DT, one, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
    lines(DT, one, type = "l", col = "black")
    lines(DT, two, type = "l", col = "red")
    lines(DT, thr, type = "l", col = "blue")
    legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
  
    axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
         labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)
    
    
  plot(DT, GRP, type = "l", 
        ylab = "Global Reactive Power (kilowatts)", xlab = "", xaxt = "n")
  
    axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
       labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)
})
dev.copy(png, file = "plot4.png")
dev.off()
