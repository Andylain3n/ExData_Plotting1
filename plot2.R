##Eploratory Data Analysis
##Course Project1
##Code for reading the data from file & plotting and producing plot2.png

library(graphics)

data<-read.table("household_power_consumption.txt",		##read the data
		      header = TRUE, sep=";",na.strings="?")


good<-((data$"Date"=="1/2/2007")|(data$"Date"=="2/2/2007")) ##select the dates given
qdata<-data[good,]

#Putting the date and time in one variable and convert it into POSIXlt:
qdata$DateTime<-paste(qdata$Date,qdata$Time)				   
qdata$DateTime<-strptime(qdata$DateTime, "%d/%m/%Y %H:%M:%S")


#To get the day names shortenings in english, set the locale:
Sys.setlocale("LC_TIME", "English")

png(filename = "plot2.png", width = 480, height = 480, units = "px") ##launch png device
plot(qdata$DateTime, qdata$"Global_active_power",type="l",main="",xlab="",
	ylab="Global Active Power (kilowatts)")
dev.off()					##closing the graphics device