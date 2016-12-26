InFile <- file("household_power_consumption.txt")
Search_Text = "^[1,2]/2/2007"

Infile_Table <- read.table(text = grep(Search_Text, readLines(InFile), value = TRUE),
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           sep = ";", header = TRUE,na.strings = "?")

## Generating Plot 1


png ("plot1.png", width = 480, height = 480)
hist(Infile_Table$Global_active_power,col="red", main = paste("Global Active Power"),
     xlab = "Global Active Power (kilowatts)")

dev.off()

