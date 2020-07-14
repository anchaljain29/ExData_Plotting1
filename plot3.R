## reading and subsetting the required data
data<- read.table("~/Downloads/household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Converting the date and time variables to date and time format using as.date() and strptime() 
subsetdata$Date<- as.Date(subsetdata$Date)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## creating and saving the plot
sub_metering1<- as.numeric(subsetdata$Sub_metering_1)
sub_metering2<- as.numeric(subsetdata$Sub_metering_2)
sub_metering3<- as.numeric(subsetdata$Sub_metering_3)
png("plot3.png",width = 480,height = 480)
plot(datetime,sub_metering1,type = "l",ylab="Energy sub meeting",xlab="")
lines(datetime,sub_metering2,type = "l",col="red")
lines(datetime,sub_metering3,type = "l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,lwd=2)
dev.off()
