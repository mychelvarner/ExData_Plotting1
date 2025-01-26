##mev For plot2.png

file <- "household_power_consumption.txt"
rawdata <- read.table(file, sep = ";", skip = 66637, nrows = 2880)

##mev Combine and convert dates and times
datetime <- strptime(paste(rawdata$V1,rawdata$V2), "%d/%m/%Y %H:%M:%S")
#datetime <- strptime(paste(rawdata$V1,rawdata$V2), "%a %d/%m/%Y %H:%M:%S")
#weekday <- strptime(paste(rawdata$V1,rawdata$V2), "%A")

##mev Combine columns for plot2
p2d <- data.frame(datetime, rawdata$V3)

##mev Add column names
names(p2d) <- c("DT", "GAP")

##mev Line plot w/ y-axis label and blank x-axis
with(p2d, 
     plot(DT, GAP, 
          type = "l", 
          ylab = "Global Active Power (kilowatts)", 
          xlab = "",
          xaxt = "n"))

axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
     labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)

##mev Copy to png and close device
dev.copy(png, file = "plot2.png")
dev.off()


