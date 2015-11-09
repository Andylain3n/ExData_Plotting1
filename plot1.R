##Eploratory Data Analysis
##Course Project1
##Code for reading the data from file & plotting and producing plot1.png
library(graphics)

data<-read.table("household_power_consumption.txt",		##read the data
		      header = TRUE, sep=";",na.strings="?")
good<-((data$"Date"=="1/2/2007")|(data$"Date"=="2/2/2007")) ##select the dates given
png(filename = "plot1.png", width = 480, height = 480, units = "px") ##launch png device
hist(data[good,]$Global_active_power,col = "red",		##making the histogram
	xlab="Global Active Power (kilowatts)",
	main="Global Active Power")
dev.off()					##closing the graphics device