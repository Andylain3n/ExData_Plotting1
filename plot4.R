##Eploratory Data Analysis
##Course Project1
##Code for reading the data from file & plotting and producing plot4.png

library(graphics)

data<-read.table("household_power_consumption.txt",		##read the data
		      header = TRUE, sep=";",na.strings="?")
good<-((data$"Date"=="1/2/2007")|(data$"Date"=="2/2/2007")) ##select the dates given
qdata<-data[good,]

#Putting the date and time in one variable and convert it into POSIXlt:
qdata$DateTime<-paste(qdata$Date,qdata$Time)				   
qdata$DateTime<-strptime(qdata$DateTime, "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480, units = "px") ##launch png device
par(mfrow = c(2,2))
plot(qdata$DateTime, qdata$"Global_active_power",type="l",main="",xlab="",
	ylab="Global Active Power (kilowatts)")

plot(qdata$DateTime, qdata$"Voltage",type="l",main="",xlab="datetime",
	ylab="Voltage")

plot(qdata$DateTime, qdata$"Sub_metering_1",type="l",main="",xlab="",
	ylab="Energy sub metering")
lines(qdata$DateTime,qdata$"Sub_metering_2",col="red")
lines(qdata$DateTime,qdata$"Sub_metering_3",col="blue")
legend("topright", col = c("black", "red", "blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
	,lty=c(1,1,1))

plot(qdata$DateTime, qdata$"Global_reactive_power",type="l",main="",xlab="datetime",
	ylab="Global_Active_Power")
dev.off()					##closing the graphics device