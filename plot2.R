#setwd("c:/users/kovlac.3/ExData_Plotting1")
getwd()
par(mfrow= c(1,1))

data <-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep= ";", header=T)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[ data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]


data2$Global_active_power  <-  as.numeric(data2$Global_active_power)

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), data2$Time,  sep =" "), format="%Y-%m-%d %H:%M:%S")
Sys.setlocale(locale = "C")



plot(data2$Global_active_power ~ data2$DateTime, type="l" , xlab="",  ylab="Global active power (kilowatts)")


dev.copy(png, file = "figure/plot2.png")
dev.off()




