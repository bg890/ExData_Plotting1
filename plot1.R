png(file = "plot1.png")  ## Create a png file

power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE) ## Read household power consumption table into R
power_febdata <- subset(power, power[,1] == "1/2/2007" | power[,1] == "2/2/2007") ## Subset Feb 1, 2007 and Feb 2, 2007 data from household power consumption table 
power_febdata$Date <- as.Date(power_febdata$Date, format="%d/%m/%Y")  ## Convert Date column to Date datatype
power_febdata$datetime <- strptime(paste(power_febdata$Date, power_febdata$Time), format = "%Y-%m-%d %H:%M:%S")  ## Create new datetime column by combining the Date column and Time column
power_febdata$Global_active_power <- as.numeric(power_febdata$Global_active_power) ## Convert Global active power column to numeric datatype

hist(power_febdata$Global_active_power, ylim = c(0,1200), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)") ## Create histogram

dev.off()  ## Close the png file