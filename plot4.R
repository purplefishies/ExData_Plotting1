#
#
#
plot4 <- function(datafile="./household_power_consumption.txt" ) {
    tmpdat <- read.csv(datafile,sep=";")

    par(mfrow = c(2, 2))

    par(bg="white")

    tmpdat$ntime <- strptime( paste(tmpdat$Date,tmpdat$Time), format="%d/%m/%Y %H:%M:%S")
    startdate = strptime("2007-02-01",format="%Y-%m-%d")
    enddate  = strptime("2007-02-03",format="%Y-%m-%d")
    filtered  <- tmpdat[tmpdat$ntime >= startdate & tmpdat$ntime < enddate,]
    filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
    filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
    filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
    filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))
    filtered$Voltage <- as.numeric(as.character(filtered$Voltage))
    
    with( filtered, { 
        plot(ntime , Global_active_power, type="l", ylab="Global Active Power",xlab="")
        plot(ntime , Voltage, type="l",xlab="datetime") 

        plot(ntime , Sub_metering_1, type="l", col="black", ylab="Energy sub metering",xlab="" )
        lines(ntime, Sub_metering_2, col="red", type="l")
        lines(ntime, Sub_metering_3, col="blue", type="l")
        legend("topright",
               col = c("black", "red","blue"),
               bty="n",
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1),
               pch=c(NA,NA,NA),
               cex=0.9,
               pt.cex=1
               )
    
        plot(filtered$ntime , Global_reactive_power, type="l",xlab="datetime")
    })

    dev.copy(png,file="plot4.png")
    dev.off()
}
