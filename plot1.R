#Plot 1

#Read txt file
powercon <- read.csv("data/household_power_consumption.txt", sep = ";",stringsAsFactors = FALSE)

#Change classes of Date and Time variables
powercon$Date <- as.Date(powercon$Date, format = "%d/%m/%Y")
powercon$DateTime <- strptime(paste(powercon$Date,powercon$Time),
format = "%Y-%m-%d %H:%M:%S")
powercon=powercon[,c(10,1,2,3,4,5,6,7,8,9)]

#Select data between "2007-2-1" to "2007-2-2"
Date_1 <- as.Date("2007-2-1")
Date_2 <- as.Date("2007-2-2")
powercon <- powercon[powercon$Date %in% Date_1:Date_2,]

#Change class of power column to numeric 
powercon[4:9] = sapply(powercon[4:9],as.numeric)

#Construct the plot
with(powercon, hist(Global_active_power, xlab = "Global Active Power",col = "red", main = "Global Active Power"))

#Save as PNG file
dev.copy(device = png, width = 480, height = 480, file = "plot1.png")