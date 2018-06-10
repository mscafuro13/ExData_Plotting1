#Read in file
powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Convert character string to Date
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

#Subset to dates of interest
powerConsumption <- subset(powerConsumption, Date == "2007-02-01" | Date == "2007-02-02")

#Convert time character string to date time
powerConsumption$Time <- strptime(x = paste(powerConsumption$Date, powerConsumption$Time), format = "%Y-%m-%d %H:%M:%S")

#Convert measures to numeric
powerConsumption$Global_active_power <- suppressWarnings(as.numeric(as.character(powerConsumption$Global_active_power)))
powerConsumption$Global_reactive_power <- suppressWarnings(as.numeric(as.character(powerConsumption$Global_reactive_power)))
powerConsumption$Voltage <- suppressWarnings(as.numeric(as.character(powerConsumption$Voltage)))
powerConsumption$Sub_metering_1 <- suppressWarnings(as.numeric(as.character(powerConsumption$Sub_metering_1)))
powerConsumption$Sub_metering_2 <- suppressWarnings(as.numeric(as.character(powerConsumption$Sub_metering_2)))
powerConsumption$Sub_metering_3 <- suppressWarnings(as.numeric(as.character(powerConsumption$Sub_metering_3)))

#Open PNG device
#png('plot3.png', width = 480, height = 480)

#Create top left chart
with(powerConsumption, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))

#Create top right chart
#plot(powerConsumption$Time, powerConsumption$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#Create lower left chart
#with(powerConsumption, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
#with(powerConsumption, lines(Time, Sub_metering_1))
#with(powerConsumption, lines(Time, Sub_metering_2, col = "Red"))
#with(powerConsumption, lines(Time, Sub_metering_3, col = "Blue"))

#Create legend
#legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("Black", "Red", "Blue"), lty = 1)

#Close the device
#dev.off()