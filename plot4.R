#setwd("c:/users/kovlac.3/ExData_Plotting1")
getwd()


data <-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep= ";", header=T)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[ data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]


data2$Global_active_power  <-  as.numeric(data2$Global_active_power)

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), data2$Time,  sep =" "), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale(locale = "C")


par(mfrow= c(2,2))

plot(data2$Global_active_power ~ data2$DateTime,  cex.lab =0.8,cex.axis =0.8, type="l" , xlab="",  ylab="Global active power")
plot(data2$Voltage ~ data2$DateTime, type="l" ,, cex.lab =0.8 ,cex.axis =0.8,xlab="datetime",  ylab="Voltage")


plot(data2$Sub_metering_1 ~ data2$DateTime , type="l",  cex.lab =0.8,cex.axis =0.8,xlab="",  ylab="Energy sub metering")
points(data2$Sub_metering_2 ~ data2$DateTime, type="l", col="red")
points(data2$Sub_metering_3 ~ data2$DateTime, type="l",col="blue")
legend("topright",lty=c (1,1,1), 
       col = c("black", "red", "blue"), bty="n", cex=0.67, pt.cex = 0.2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



plot(data2$Global_reactive_power ~ data2$DateTime,  cex.lab =0.8, cex.axis =0.8 , lwd= 0.01,type="l" , xlab="datetime",  ylab="Global_reactive_power")



######
dev.copy(png, file = "figure/plot4.png")
dev.off()
