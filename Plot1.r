#library('reshape')
#library('reshape2')

### --- Download Data and Extract to a Directory --- ###
dlData<-function()
{
  dataFile <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(dataFile, 'Electric_power_consumption.zip', method='curl')
  unzip('Electric_power_consumption.zip')

}
if (!file.exists("household_power_consumption.txt")) {
dlData()
}
### --- Download Data and Extract to a Directory --- ###

pwrTbl <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pwrTbl) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
pwr2 <- subset(pwrTbl,pwrTbl$Date=="1/2/2007" | pwrTbl$Date =="2/2/2007")

hist(as.numeric(as.character(pwr2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

dev.copy(png,"plot1.png", width=480, height=480)
dev.off()