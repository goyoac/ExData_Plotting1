Sys.setlocale(category = "LC_ALL", locale = "english")

library(data.table)

fiveRows <- read.table("household_power_consumption.txt", 
                       header = TRUE,
                       sep=';', 
                       comment.char = "",
                       na.strings="?",
                       nrows = 5)
classes <- sapply(fiveRows, class)

data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep=';', 
                   comment.char = "",
                   na.strings="?",                     
                   colClasses = classes
)


selectedDatesData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,] 

dateTime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(dateTime, selectedDatesData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, selectedDatesData$Sub_metering_2, type="l", col="red")
lines(dateTime, selectedDatesData$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()