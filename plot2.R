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

# Constructing plot2
with(powerConsump, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Gloabl Active Power (kilowatts)", xaxt="n"))
axis(side=1, at = c(as.numeric(powerConsump$DateTime[1]),
                    as.numeric(powerConsump$DateTime[1441]),
                    as.numeric(powerConsump$DateTime[2880])), labels=c("Thu", "Fri", "Sat"))

# Save plot2 as PNG file
dev.copy(device = png, width=480, height=480, file = "plot2.png")
dev.off()