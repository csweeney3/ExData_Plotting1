DS <- read.csv("household_power_consumption.txt",sep=";", header=T, dec=".",colClasses = "character")
PowerDS <-subset(DS,Date == "1/2/2007" | Date == "2/2/2007")
PowerDS$Date <-as.character(PowerDS$Date)
PowerDS$Time <-as.character(PowerDS$Time)
PowerDS$DateTime <-paste(PowerDS$Date, PowerDS$Time)
PowerDS$DateTime <- strptime(PowerDS$DateTime , format = "%d/%m/%Y %H:%M:%S")

png("plot1.png")

hist(as.numeric(PowerDS$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()

 