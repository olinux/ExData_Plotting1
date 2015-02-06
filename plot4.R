# Please note: This file involves the code for the creation of the specific plot only. 
# These functions can be invoked either seperately on the console or by sourcing 
# "commons.R" and invoking the method "writeAllPlots". Reading the data from the web-source is also
# provided in commons.R

buildVoltageLinePlot <- function(data, parsedDateTimes){
          plot(parsedDateTimes, data$Voltage, type="l", xlab="datetime",ylab="Voltage")
}

buildGRPLinePlot <- function(data, parsedDateTimes){
          plot(parsedDateTimes, data$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")          
}


buildOverviewPlot <- function(data, parsedDateTimes){           
          par(mfrow=c(2,2))
          buildGAPLinePlot(data, parsedDateTimes, ylabel = "Global Active Power")
          buildVoltageLinePlot(data, parsedDateTimes)
          buildESMLinePlot(data, parsedDateTimes, legendBorder = "n")
          buildGRPLinePlot(data, parsedDateTimes)
}

writeOverviewPlotToFile <- function(data, parsedDateTimes){
          png(filename="plot4.png", width=480, height=480, units="px", bg="transparent")
          buildOverviewPlot(data, parsedDateTimes)
          dev.off()
}

