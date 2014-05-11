setwd("c:/users/kovlac.3/ExData_Plotting1")
getwd()
par(mfrow= c(1,1))

data <-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep= ";", header=T)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[ data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]


data2$Global_active_power  <-  as.numeric(data2$Global_active_power)

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), data2$Time,  sep =" "), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale(locale = "C")



plot(data2$Sub_metering_1 ~ data2$DateTime , type="l", xlab="",  ylab="Energy sub metering")
points(data2$Sub_metering_2 ~ data2$DateTime, type="l", col="red")
points(data2$Sub_metering_3 ~ data2$DateTime, type="l",col="blue")
legend("topright",lty=c (1,1,1), 
       col = c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


dev.copy(png, file = "figure/plot3.png")
dev.off()