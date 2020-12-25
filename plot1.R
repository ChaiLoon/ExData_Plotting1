#read in the text file
powerConsump<- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors =  FALSE)

#convert the Date and Time variables to Date/Time classes
powerConsump$Date <- as.Date(powerConsump$Date, format="%d/%m/%y")
powerConsump$DateTime <- strptime(paste(powerConsump$Date, powerConsump$Time), format = "%Y-%m-%d %h:%M:%S")

#selcct data from 