#
#
#
plot2 <- function(datafile="./household_power_consumption.txt" ) {
    tmpdat <- read.csv(datafile,sep=";")
    par(bg="white")
    ## tmpdat$Date <- as.Date( tmpdat$Date, format="%d/%m/%Y" )
    tmpdat$ntime <- strptime( paste(tmpdat$Date,tmpdat$Time), format="%d/%m/%Y %H:%M:%S")
    startdate = strptime("2007-02-01",format="%Y-%m-%d")
    enddate  = strptime("2007-02-03",format="%Y-%m-%d")
    filtered  <- tmpdat[tmpdat$ntime >= startdate & tmpdat$ntime < enddate,]
    filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
    plot(filtered$ntime , filtered$Global_active_power, type="l", ylab="Global Active Power (kilowatts)",xlab="")
    dev.copy(png,file="plot2.png")
    dev.off()
}
