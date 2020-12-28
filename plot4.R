# Download data set and set working directory

# Read in the text file
powerConsump<- read.csv("household_power_consumption.txt", sep = ";",stringsAsFactors =  FALSE)

# Convert the Date and Time variables to Date/Time classes
powerConsump$Date <- as.Date(powerConsump$Date,"%d/%m/%Y")
powerConsump$DateTime <- strptime(paste(powerConsump$Date, powerConsump$Time), format = "%Y-%m-%d %H:%M:%S")

# Select data from "2007-02-01" and "2007-02-02"
powerConsump <- powerConsump[powerConsump$Date >= "2007-2-1" & powerConsump$Date <= "2007-2-2",]

# Change classes of data's 3:8 columns
powerConsump[,3] <- as.numeric(powerConsump[,3])
powerConsump[,4] <- as.numeric(powerConsump[,4])
powerConsump[,5] <- as.numeric(powerConsump[,5])
powerConsump[,6] <- as.numeric(powerConsump[,6])
powerConsump[,7] <- as.numeric(powerConsump[,7])
powerConsump[,8] <- as.numeric(powerConsump[,8])

# Constructing plot4
par(mfrow = c(2,2))

# Top left plot
with(powerConsump, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Gloabl Active Power", xaxt="n"))
axis(side=1, at=c(as.numeric(powerConsump$DateTime[1]),
                  as.numeric(powerConsump$DateTime[1441]),
                  as.numeric(powerConsump$DateTime[2880])),labels=c("Thu", "Fri", "Sat"))

# Top right plot
with(powerConsump,plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n"))
axis(side=1, at=c(as.numeric(powerConsump$DateTime[1]),
                  as.numeric(powerConsump$DateTime[1441]),
                  as.numeric(powerConsump$DateTime[2880])),labels=c("Thu", "Fri", "Sat"))

# Bottom left
with(powerConsump, plot(DateTime, Sub_metering_1, type="n", xaxt="n", xlab="", ylab="Energy sub metering"))
axis(side=1, at=c(as.numeric(powerConsump$DateTime[1]),
                  as.numeric(powerConsump$DateTime[1441]),
                  as.numeric(powerConsump$DateTime[2880])),labels=c("Thu", "Fri", "Sat"))
with(powerConsump, lines(DateTime, Sub_metering_1))
with(powerConsump,lines(DateTime, Sub_metering_2, col="red"))
with(powerConsump,lines(DateTime, Sub_metering_3, col="blue"))
text=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",lty=1,
       legend=text,col=c("black", "red","blue"),cex=0.25,y.intersp=0.125)

# Bottom right
with(powerConsump, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power",xaxt="n"))
axis(side=1, at=c(as.numeric(powerConsump$DateTime[1]),
                  as.numeric(powerConsump$DateTime[1441]),
                  as.numeric(powerConsump$DateTime[2880])),labels=c("Thu","Fri","Sat"))
# Save as plot4.png
dev.copy(device=png, width=480, height=480, file="plot4.png")
dev.off()