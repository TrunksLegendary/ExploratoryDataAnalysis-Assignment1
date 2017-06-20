library('reshape')
library('reshape2')

### --- Download Data and Extract to a Directory --- ###
dlData<-function(n)
{
  dataFile <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(dataFile, 'Electric_power_consumption.zip', method='curl')
  unzip('Electric_power_consumption.zip')

}
if (!file.exists("household_power_consumption.txt")) {
dlData()
}

pwrTbl <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pwrTbl) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
pwr2 <- subset(pwrTbl,pwrTbl$Date=="1/2/2007" | pwrTbl$Date =="2/2/2007")

pwr2$Date <- as.Date(pwr2$Date, format="%d/%m/%Y")
pwr2$Time <- strptime(pwr2$Time, format="%H:%M:%S")
pwr2[1:1440,"Time"] <- format(pwr2[1:1440,"Time"],"2007-02-01 %H:%M:%S")
pwr2[1441:2880,"Time"] <- format(pwr2[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(pwr2$Time,as.numeric(as.character(pwr2$Global_active_power)),type="l",xlab="",ylab="Global Active Power k/watts)") 

title(main="Global Active Power Vs Time")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()