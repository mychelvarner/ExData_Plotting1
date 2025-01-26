##mev For plot3.png

file <- "household_power_consumption.txt"
rawdata <- read.table(file, sep = ";", skip = 66637, nrows = 2880)

##mev Combine and convert dates and times
datetime <- strptime(paste(rawdata$V1,rawdata$V2), "%d/%m/%Y %H:%M:%S")

##mev Combine columns for plot3
p3d <- data.frame(datetime, rawdata$V7, rawdata$V8, rawdata$V9)

##mev Add column names
names(p3d) <- c("DT", "one", "two", "thr")

##mev Line plots w/ y-axis label and blank x-axis
plot(p3d$DT, p3d$one, 
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = "",
     xaxt = "n")

axis(1, at = c(p2d[1,1], p2d[1441,1], p2d[2880,1]), 
     labels = c("Thu", "Fri", "Sat"), lwd = 0, lwd.ticks = 1.5)

lines(p3d$DT, p3d$one, type = "l", col = "black")
lines(p3d$DT, p3d$two, type = "l", col = "red")
lines(p3d$DT, p3d$thr, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.copy(png, file = "plot3.png")
dev.off()
