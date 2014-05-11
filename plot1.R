setwd("c:/users/kovlac.3/ExData_Plotting1")
getwd()

data <-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, sep= ";", header=T)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[ data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]


data2$Global_active_power  <-  as.numeric(data2$Global_active_power)


hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.copy(png, file = "figure/plot1.png")
dev.off()