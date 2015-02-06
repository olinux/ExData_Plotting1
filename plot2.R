# Please note: This file involves the code for the creation of the specific plot only. 
# These functions can be invoked either seperately on the console or by sourcing 
# "commons.R" and invoking the method "writeAllPlots". Reading the data from the web-source is also
# provided in commons.R

buildGAPLinePlot <- function(data, parsedDateTimes, ylabel="Global Active Power (kilowatts)"){
          plot(parsedDateTimes, data$Global_active_power,type="l", xlab="", ylab=ylabel)
}

writeGAPLinePlotToFile <- function(data, parsedDateTimes){
          png(filename="plot2.png", width=480, height=480, units="px", bg="transparent")
          buildGAPLinePlot(data, parsedDateTimes)
          dev.off()
}