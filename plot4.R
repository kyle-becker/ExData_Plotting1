setwd("C:\\Users\\kbec\\EDA_Assignment1") # setting working directory to my forked git hub repository

Electric_Power_Consumption <- read.table("C:\\Users\\kbec\\EDA_Assignment1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #reading in dataset and change ? to NA
Electric_Power_Consumption_subset <- subset(Electric_Power_Consumption, Electric_Power_Consumption$Date=='1/2/2007' | Electric_Power_Consumption$Date=='2/2/2007') # subsetting data to include only the two days of data required

Electric_Power_Consumption_subset$Date <- as.Date(Electric_Power_Consumption_subset$Date,"%d/%m/%Y") # converting the date column to a date format
EPCS<-cbind(Electric_Power_Consumption_subset, "Date_Time" = as.POSIXct(paste(Electric_Power_Consumption_subset$Date, Electric_Power_Consumption_subset$Time))) #Converting Date and time to one column called Date_Time

png("plot4.png", width = 480, height = 480) #creating a png device of the required height and width specifications
par(mfrow=c(2,2)) #resizing the graph area to accomodate a 2 by 2 (4 in total) section of graphs
Line_Graph <- plot(EPCS$Global_active_power~EPCS$Date_Time, type="l", xlab="", ylab="Global Active Power (kilowatts)") #Creating a line graph of Global active power usage vs time of day

plot(EPCS$Voltage ~ EPCS$Date_Time, type="l", xlab ="datetime", ylab = "Voltage" ) # adding a second graph to the are of Voltage vs time of day

Energy_Sub_Metering <- plot(EPCS$Sub_metering_1~EPCS$Date_Time, type = "l", xlab = "", ylab = "Energy Sub Metering") 
lines(EPCS$Sub_metering_2~EPCS$Date_Time, col="red")
lines(EPCS$Sub_metering_3~EPCS$Date_Time, col="blue")
legend("topright", lty=1, lwd=4, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(EPCS$Global_reactive_power ~ EPCS$Date_Time, type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off() #closing the device causing the image to be saved in the active working directory