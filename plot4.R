InFile <- file("household_power_consumption.txt")
Search_Text = "^[1,2]/2/2007"

Infile_Table <- read.table(text = grep(Search_Text, readLines(InFile), value = TRUE),
                           col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                           sep = ";", header = TRUE,na.strings = "?")

## Converting dates
Infile_Table$DateTime <- as.POSIXct(paste(as.Date(Infile_Table$Date,format = "%d/%m/%Y"), 
                                          Infile_Table$Time))
png ("plot4.png", width = 480, height = 480)


## Generating Plot 4

par(mfrow = c(2,2), mar = c(4,4,2,1),oma = c(0,0,2,0))
with(Infile_Table, {
    plot(Infile_Table$Global_active_power ~ Infile_Table$DateTime, 
         type = "l", 
         ylab = "Global Active Power", xlab = "")
    plot(Infile_Table$Voltage ~ Infile_Table$DateTime, 
         type = "l", 
         ylab = "Voltage", xlab = "datetime")
    plot(Infile_Table$Sub_metering_1 ~ Infile_Table$DateTime, 
         type = "l", 
         ylab = "Energy sub metering",
         xlab = "")
    lines(Infile_Table$Sub_metering_2 ~ Infile_Table$DateTime, 
          col = 'Red')
    lines(Infile_Table$Sub_metering_3 ~ Infile_Table$DateTime, 
          col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2.5,  
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Infile_Table$Global_reactive_power ~ Infile_Table$DateTime, 
         type = "l", 
         ylab = "Global_rective_power", xlab = "datetime")
})
dev.off()