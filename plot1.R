## Reading and subsetting the required data

data<- read.table("~/Downloads/household_power_consumption.txt",header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetdata<- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## creating histogram
globalActivePower<- as.numeric(subsetdata$Global_active_power)
plot1<-hist(globalActivePower,col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
