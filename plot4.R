png(file = "plot4.png")  ## Create a png file
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE) ## Read household power consumption table into R
power_febdata <- subset(power, power[,1] == "1/2/2007" | power[,1] == "2/2/2007") ## Subset Feb 1, 2007 and Feb 2, 2007 data from household power consumption table 

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) ## Create two plots per row and two plots per column and set margins
with(power_febdata, {
   power_febdata$Date <- as.Date(power_febdata$Date, format="%d/%m/%Y") ## Convert Date coluem to Date datatype
   power_febdata$datetime <- strptime(paste(power_febdata$Date, power_febdata$Time), format = "%Y-%m-%d %H:%M:%S") ## Create new datetime column by combining the Date column and Time column
   power_febdata$Global_active_power <- as.numeric(power_febdata$Global_active_power) ## Convert Global Active power column to numeric datatype
   plot(x = power_febdata$datetime, y = power_febdata$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l") ## Create plot #1
   plot(x = power_febdata$datetime, y = power_febdata$Voltage, ylab = "Voltage", xlab = "datetime", type = "l") ## Create plot #2
   plot(x = power_febdata$datetime, y = power_febdata$Sub_metering_1, ylab = "Energy sub meeting", xlab = "", type ="l") ## Create plot #3
   points( x = power_febdata$datetime, y = power_febdata$Sub_metering_2, ylab = "Energy sub meeting", xlab = "", type = "l", col = "red") ## Add annotation to plot #3
   points( x = power_febdata$datetime, y = power_febdata$Sub_metering_3, ylab = "Energy sub meeting", xlab = "", type = "l", col = "blue") ## Add annotation to plot #3
   legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## Add legend to plot #3
   plot(x = power_febdata$datetime, y = power_febdata$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l") ## Create plot #4
    
    })

dev.off()  ## close the png file