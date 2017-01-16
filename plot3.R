setwd("C:\\Users\\kbec\\EDA_Assignment1") # setting working directory to my forked git hub repository

Electric_Power_Consumption <- read.table("C:\\Users\\kbec\\EDA_Assignment1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #reading in dataset and change ? to NA
Electric_Power_Consumption_subset <- subset(Electric_Power_Consumption, Electric_Power_Consumption$Date=='1/2/2007' | Electric_Power_Consumption$Date=='2/2/2007') # subsetting data to include only the two days of data required

Electric_Power_Consumption_subset$Date <- as.Date(Electric_Power_Consumption_subset$Date,"%d/%m/%Y") # converting the date column to a date format
EPCS<-cbind(Electric_Power_Consumption_subset, "Date_Time" = as.POSIXct(paste(Electric_Power_Consumption_subset$Date, Electric_Power_Consumption_subset$Time))) #Converting Date and time to one column called Date_Time

png("plot3.png", width = 480, height = 480) #creating a png device of the required height and width specifications
Energy_Sub_Metering <- plot(EPCS$Sub_metering_1~EPCS$Date_Time, type = "l", xlab = "", ylab = "Energy Sub Metering") #creating line graph of Sub_metering1 which by default is black
lines(EPCS$Sub_metering_2~EPCS$Date_Time, col="red") # Adding an additional line to the graph depicting Sub_Metering2 usage in red
lines(EPCS$Sub_metering_3~EPCS$Date_Time, col="blue") #Adding a 3rd line to the graph depicting sub_Meterin3 usage in blue
legend("topright", lty=1, lwd=4, col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) #Adding a legend to the graph showing what each color represents
dev.off() #closing the device causing the image to be saved in the active working directory