DS <- read.csv("household_power_consumption.txt",sep=";", header=T, dec=".",colClasses = "character")
PowerDS <-subset(DS,Date == "1/2/2007" | Date == "2/2/2007")
PowerDS$Date <-as.character(PowerDS$Date)
PowerDS$Time <-as.character(PowerDS$Time)
PowerDS$DateTime <-paste(PowerDS$Date, PowerDS$Time)
PowerDS$DateTime <- strptime(PowerDS$DateTime , format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")

#upper left plot
par(mfrow=c(2,2))
plot(PowerDS$DateTime, PowerDS$Global_active_power, type="l",xlab="", ylab="Global Active Power")

#upper right plot
plot(PowerDS$DateTime, PowerDS$Voltage, type="l",xlab="", ylab="Voltage")
title(sub="datetime")

#lower left plot
plot(PowerDS$DateTime, PowerDS$Sub_metering_1,col="black", type="l", ylab="Energy sub metering",xlab="")  
box()
lines(PowerDS$DateTime,PowerDS$Sub_metering_2, type="l",col="red")
lines(PowerDS$DateTime,PowerDS$Sub_metering_3, type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black","red","blue"))

#lower right plot
plot(PowerDS$DateTime, PowerDS$Global_reactive_power, type="l",xlab="", ylab="Global_reactive_power")
title(sub="datetime")

dev.off()
