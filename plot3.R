InFile <- file("household_power_consumption.txt")
Search_Text = "^[1,2]/2/2007"

Infile_Table <- read.table(text = grep(Search_Text, readLines(InFile), value = TRUE),
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           sep = ";", header = TRUE,na.strings = "?")

## Converting dates
Infile_Table$DateTime <- as.POSIXct(paste(as.Date(Infile_Table$Date,format = "%d/%m/%Y"), 
                                          Infile_Table$Time))
png ("plot3.png", width = 480, height = 480)


## Generating Plot 3
with(Infile_Table, {
    plot(Infile_Table$Sub_metering_1 ~ Infile_Table$DateTime , type = "l", 
         ylab = "Energy Sub Metering", xlab = "")
    lines(Infile_Table$Sub_metering_2 ~ Infile_Table$DateTime, col = 'Red')
    lines(Infile_Table$Sub_metering_3 ~ Infile_Table$DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2.5, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()