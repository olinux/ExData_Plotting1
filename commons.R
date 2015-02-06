#This file provides shared functionalities required in all plotting scenarios of 
#this project to get rid of code duplication

#Read the data from the web and define required data types
readData <- function(){
          require(data.table)
          if(!file.exists("power_consumption.zip")){
                    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip", method="curl")
                    unzip("power_consumption.zip")
          }
          data <- subset(fread("household_power_consumption.txt", sep=";", na.strings="?", colClasses="character"), Date=="1/2/2007" | Date=="2/2/2007");
          data$Global_active_power <- as.numeric(data$Global_active_power)
          data$DateTime <- paste(data$Date, data$Time)
          data$Global_active_power <- as.numeric(data$Global_active_power)
          data
}

# This is the "main" method, sourcing all required files, reading 
# data from the web and invoking the build of all plots.
writeAllPlots <- function(){
          #To change the locale to English (US) - and therefore to get English weekday names - execute the following command (on Linux)
          #Sys.setlocale("LC_TIME", "en_US.UTF-8")
          source("plot1.R")
          source("plot2.R")
          source("plot3.R")
          source("plot4.R")
          data <- readData()
          parsedDateTimes <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
          writeGAPHistogramToFile(data)
          writeGAPLinePlotToFile(data, parsedDateTimes)
          writeESMLinePlotToFile(data, parsedDateTimes)
          writeOverviewPlotToFile(data, parsedDateTimes)
}
