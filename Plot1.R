#Set working directory and Downloaded file
setwd("C:/Users/MSingh/Downloads/exdata_data_household_power_consumption")
#read txt file
data <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
head(data)
summary(data)
#Change classes of Date and Time variables
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date,data$Time),
                                 format = "%Y-%m-%d %H:%M:%S")
#Choose data from "2007-2-1" to "2007-2-2"
data <- data[data$Date >= "2007-2-1" & data$Date <= "2007-2-2",]

#Change classes of Data's 3:8 columns
data[,3] <- as.numeric(data[,3])
data[,4] <- as.numeric(data[,4])
data[,5] <- as.numeric(data[,5])
data[,6] <- as.numeric(data[,6])
data[,7] <- as.numeric(data[,7])
data[,8] <- as.numeric(data[,8])

#Constructing Plot1
with(data, hist(Global_active_power, xlab = "Global Active Power (kilowatts)",
                       col = "red", main = "Global Active Power"))
#Save plot1 to a PNG file
dev.copy(device = png, width = 480, height = 480, file = "Plot1.png")
