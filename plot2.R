## reading and subsetting the required data
data<- read.table("~/Downloads/household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007"),]
## Converting the date and time variables to date and time format using as.date() and strptime() 
subsetdata$Date<- as.Date(subsetdata$Date)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Creating and saving the line graph
globalActivePower <- as.numeric(subsetdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot2<-plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
