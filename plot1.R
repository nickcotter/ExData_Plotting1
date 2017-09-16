if(!file.exists("household_power_consumption.txt")) { 
        message("Data file not present, downloading and unzipping...");
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "household_power_consumption.zip")
        unzip("household_power_consumption.zip")
}

message("loading data into hpc data frame")

hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = c("?"))

message("loading feb 1st & 2nd 2007 data into hpc_feb data frame")

hpc$Date <- as.Date(hpc$Date, format("%d/%m/%Y"))
hpc_feb <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(hpc_feb$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")