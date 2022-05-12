#Plot 4

#Read txt file
powercons <- read.csv("data/household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)

#Change classes of Date and Time variables
powercons$Date <- as.Date(powercons$Date, format = "%d/%m/%Y")
powercons$DateTime <- strptime(paste(powercons$Date,powercons$Time),
                           format = "%Y-%m-%d %H:%M:%S")
powercons=powercons[,c(10,1,2,3,4,5,6,7,8,9)]

#Data between "2007-2-1" to "2007-2-2"
Date_1 <- as.Date("2007-2-1")
Date_2 <- as.Date("2007-2-2")
powercons <- powercons[powercons$Date %in% Date_1:Date_2,]

#Change class to numeric 
powercons[4:9] = sapply(powercons[4:9],as.numeric)

#Construct Plots
par(mfrow = c(2,2))

#Plot at top left
plot(powercons$DateTime, powercons$Global_active_power, type = "l", xlab = "Dates",ylab = "Global Active Power (kilowatts)")

#Plot at top right
plot(powercons$DateTime, powercons$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Plot bottom left
plot(powercons$DateTime, powercons$Sub_metering_1, type = "l", xlab = "Days", ylab = "Energy sub metering")

lines(powercons$DateTime, powercons$Sub_metering_2,col="red")
lines(powercons$DateTime, powercons$Sub_metering_3,col="blue")
legend("topright",lty = 1,
       legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),adj = c(0, 1), cex=0.35)

#Plot bottom right
plot(powercons$DateTime, powercons$Global_reactive_power, type= "l", xlab = "datetime",ylab = "Global_reactive_power")

#Save Plot
#dev.copy(device = png, width = 480, height = 480, file = "plot4.png")