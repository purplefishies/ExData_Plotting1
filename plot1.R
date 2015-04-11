#
#
#
plot1 <- function(datafile="./household_power_consumption.txt" ) {
    par(bg="white")
    tmpdat <- read.csv(datafile,sep=";")
    tmpdat$Date <- as.Date( tmpdat$Date, format="%d/%m/%Y" )
    filtered  <- tmpdat[tmpdat$Date == as.Date("2007-02-02") | tmpdat$Date == as.Date("2007-02-01"),]
    filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
    hist(filtered$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
    dev.copy(png,file="plot1.png")
    dev.off()
}
