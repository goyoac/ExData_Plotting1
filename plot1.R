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

png("plot1.png", width=480, height=480)
hist(selectedDatesData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

