#Read in file
powerConsumption <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#Convert character string to Date
powerConsumption$Date <- as.Date(powerConsumption$Date, "%d/%m/%Y")

#Subset to dates of interest
powerConsumption <- subset(powerConsumption, Date == "2007-02-01" | Date == "2007-02-02")

#Convert time character string to date time
powerConsumption$Time <- strptime(x = paste(powerConsumption$Date, powerConsumption$Time), format = "%Y-%m-%d %H:%M:%S")

#Convert Global Active Power to numeric
powerConsumption$Global_active_power <- suppressWarnings(as.numeric(as.character(powerConsumption$Global_active_power)))

#Open PNG device
png('plot1.png', width = 480, height = 480)

#Create Chart
hist(powerConsumption$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")

#Close the device
dev.off()