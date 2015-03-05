#Plot 3 - Energy sub metering graph
#Usage:
#        plot("household_power_consumption.txt") #pass in the full or relative file path and name
#Output
#       png file with the graph in the working directory
plot3 <- function(dataFile="/Users/benilmathew/Documents/MOOCS/Coursera/Data_science/4-Exploratory_Data_Analysis/Assignments/Assignment1/household_power_consumption.txt") {
        #Stop if the file passed in is valid
        if(is.null(dataFile) || !file.exists(dataFile)) {
                stop("Invalid data file")
        }
        #Read the file
        data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")
        #Format input dates
        fromDate <- as.Date("2007-02-01")
        toDate <- as.Date("2007-02-02")
        #Format the date values in the data
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        #Subset the data based on input dates
        data <- data[data$Date >= fromDate & data$Date <= toDate, ]
        #Concatenate the date and time
        data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))
        #Specify the graphic deivce, png file
        png(file = "plot3.png", width=480, height=480, bg="white")
        #Plot the graph
        with(data, {
                plot(DateTime, Sub_metering_1, type = "l", bg="white", col="black", 
                     ylab="Energy sub metering", xlab="")
                lines(DateTime, Sub_metering_2, col="red")
                lines(DateTime, Sub_metering_3, col="blue")
        })
        legend("topright", lty=1, lwd=2, seg.len=1, col = c("black", "red", "blue"), legend = 
                       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off() #close the graphic device!
}