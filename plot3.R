png(file = "plot3.png")  ## Create a png file

power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE) ## Read household power consumption table into R
power_febdata <- subset(power, power[,1] == "1/2/2007" | power[,1] == "2/2/2007") ## Subset Feb 1, 2007 and Feb 2, 2007 data from household power consumption table 
power_febdata$Date <- as.Date(power_febdata$Date, format="%d/%m/%Y") ## Convert Date column to Date datatype
power_febdata$datetime <- strptime(paste(power_febdata$Date, power_febdata$Time), format = "%Y-%m-%d %H:%M:%S") ## Create new datetime column by combining the Date column and Time column
power_febdata$Global_active_power <- as.numeric(power_febdata$Global_active_power) ## Convert Global active power column to numeric datatype

with(power_febdata, plot(x = power_febdata$datetime, y = power_febdata$Sub_metering_1, ylab = "Energy sub meeting", xlab = "", type ="l")) ## Create plot
points( x = power_febdata$datetime, y = power_febdata$Sub_metering_2, ylab = "Energy sub meeting", xlab = "", type = "l", col = "red") ## Add annotation to the plot
points( x = power_febdata$datetime, y = power_febdata$Sub_metering_3, ylab = "Energy sub meeting", xlab = "", type = "l", col = "blue") ## Add annotation to the plot
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ## Create legend for the plot

dev.off()  ## Close the png file