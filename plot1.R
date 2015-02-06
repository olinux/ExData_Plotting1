# Please note: This file involves the code for the creation of the specific plot only. 
# These functions can be invoked either seperately on the console or by sourcing 
# "commons.R" and invoking the method "writeAllPlots". Reading the data from the web-source is also
# provided in commons.R

buildGAPHistogram <- function(data){
          hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
}

writeGAPHistogramToFile <- function(data){      
          png(filename="plot1.png", width=480, height=480, units="px", bg="transparent")
          buildGAPHistogram(data)
          dev.off()
}