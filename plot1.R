setwd("C:\\Users\\kbec\\EDA_Assignment1") # setting working directory to my forked git hub repository

Electric_Power_Consumption <- read.table("C:\\Users\\kbec\\EDA_Assignment1\\household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") #reading in dataset and change ? to NA
Electric_Power_Consumption_subset <- subset(Electric_Power_Consumption, Electric_Power_Consumption$Date=='1/2/2007' | Electric_Power_Consumption$Date=='2/2/2007') # subsetting data to include only the two days of data required

Electric_Power_Consumption_subset$Date <- as.Date(Electric_Power_Consumption_subset$Date,"%d/%m/%Y") # converting the date column to a date format
EPCS<-cbind(Electric_Power_Consumption_subset, "Date_Time" = as.POSIXct(paste(Electric_Power_Consumption_subset$Date, Electric_Power_Consumption_subset$Time))) #Converting Date and time to one column called Date_Time

png("plot1.png", width = 480, height = 480) #creating a png device of the required height and width specifications
Histogram <- hist(EPCS$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power") #creating a histogram of the frequency of the Global active power variable colored red with an x label of Global Active Power (kilowatts) and a title of Global active power
dev.off() #closing the device causing the image to be saved in the active working directory