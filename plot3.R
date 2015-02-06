# Please note: This file involves the code for the creation of the specific plot only. 
# These functions can be invoked either seperately on the console or by sourcing 
# "commons.R" and invoking the method "writeAllPlots". Reading the data from the web-source is also
# provided in commons.R

buildESMLinePlot <- function(data, parsedDateTimes, legendBorder="o"){ 
          plot(parsedDateTimes, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
          lines(parsedDateTimes, data$Sub_metering_2, type="l", col="red")
          lines(parsedDateTimes, data$Sub_metering_3, type="l", col="blue")
          legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), bty=legendBorder)
}

writeESMLinePlotToFile <- function(data, parsedDateTimes){
          png(filename="plot3.png", width=480, height=480, units="px", bg="transparent")  
          buildESMLinePlot(data, parsedDateTimes)
          dev.off()       
}
