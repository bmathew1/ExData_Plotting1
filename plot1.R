#Plot 1 - Global Active Power histogram
#Usage:
#        plot("household_power_consumption.txt") #pass in the full or relative file path and name
#Output
#       png file with the graph in the working directory
plot1 <- function(dataFile="/Users/benilmathew/Documents/MOOCS/Coursera/Data_science/4-Exploratory_Data_Analysis/Assignments/Assignment1/household_power_consumption.txt") {
        #Stop if the file passed in is valid
        if(is.null(dataFile) || !file.exists(dataFile)) {
                stop("Invalid data file")
        }
        #Read the data from file
        data <- read.table(dataFile, header=TRUE, sep=";", na.strings="?")
        #input dates
        fromDate <- as.Date("2007-02-01")
        toDate <- as.Date("2007-02-02")
        #format the date values in the data
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        #subset the data based input dates
        data <- data[data$Date >= fromDate & data$Date <= toDate, ]
        #Setup the graphics device, png file, in this case
        png(file = "plot1.png", width=480, height=480, bg="white")
        par(mfrow=c(1,1))
        # Plot the data with appropriate labels
        hist(data$Global_active_power, col=2, xlab="Global Active Power (kilowatts)", 
             ylab="Frequency", main="Global Active Power")
        dev.off() ## close the graphic device!
}