#Plot 2 - Global Active Power line graph
#Usage:
#        plot("household_power_consumption.txt") #pass in the full or relative file path and name
#Output
#       png file with the graph in the working directory
plot2 <- function(dataFile="/Users/benilmathew/Documents/MOOCS/Coursera/Data_science/4-Exploratory_Data_Analysis/Assignments/Assignment1/household_power_consumption.txt") {
        #Stop if the file passed in is valid
        if(is.null(dataFile) || !file.exists(dataFile)) {
                stop("Invalid data file")
        }
        #Read the data from file
        data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")
        #Input dates
        fromDate <- as.Date("2007-02-01")
        toDate <- as.Date("2007-02-02")
        #Format date values in data
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        #Subset the data based on input dates
        data <- data[data$Date >= fromDate & data$Date <= toDate, ]
        #Put date a dime together for plotting
        data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S"))
        #The plotting device, png file in this case
        png(file = "plot2.png", width=480, height=480, bg="white")
        #Set parameters and plot
        par(mfrow=c(1,1))
        plot(data$DateTime, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
        dev.off() #close the graphic device!
}