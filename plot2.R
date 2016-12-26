InFile <- file("household_power_consumption.txt")
Search_Text = "^[1,2]/2/2007"

Infile_Table <- read.table(text = grep(Search_Text, readLines(InFile), value = TRUE),
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           sep = ";", header = TRUE,na.strings = "?")


## Converting dates
Infile_Table$DateTime <- as.POSIXct(paste(as.Date(Infile_Table$Date,format = "%d/%m/%Y"), 
                                          Infile_Table$Time))
png ("plot2.png", width = 480, height = 480)

## Generating Plot 2
plot(Infile_Table$Global_active_power ~ Infile_Table$DateTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()