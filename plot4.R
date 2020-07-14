## reading and subsetting the required data
data<- read.table("~/Downloads/household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## converting date and time in suitable format
subsetdata$Date<- as.Date(subsetdata$Date)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creating and saving the plot

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime,subsetdata$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

plot(datetime,sub_metering1,type = "l",ylab="Energy sub meeting",xlab="")
lines(datetime,sub_metering2,type = "l",col="red")
lines(datetime,sub_metering3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),bty = "n",cex = 0.6,lty = 1,lwd=2)

plot(datetime,subsetdata$Global_reactive_power,type = "l",xlab="datetime",ylab = "Global_reactive_power")

dev.off()
