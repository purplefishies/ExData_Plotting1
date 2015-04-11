#
#
#
plot3 <- function(datafile="./household_power_consumption.txt" ) {
    tmpdat <- read.csv(datafile,sep=";")
    par(mfrow = c(1, 1))
    par(bg="white")

    tmpdat$ntime <- strptime( paste(tmpdat$Date,tmpdat$Time), format="%d/%m/%Y %H:%M:%S")
    startdate = strptime("2007-02-01",format="%Y-%m-%d")
    enddate  = strptime("2007-02-03",format="%Y-%m-%d")
    filtered  <- tmpdat[tmpdat$ntime >= startdate & tmpdat$ntime < enddate,]
    filtered$Global_active_power <- as.numeric(as.character(filtered$Global_active_power))
    filtered$Sub_metering_1 <- as.numeric(as.character(filtered$Sub_metering_1))
    filtered$Sub_metering_2 <- as.numeric(as.character(filtered$Sub_metering_2))
    filtered$Sub_metering_3 <- as.numeric(as.character(filtered$Sub_metering_3))

    plot(filtered$ntime , filtered$Sub_metering_1, type="l", col="black", ylab="Energy sub metering",xlab="" )
    
    lines(filtered$ntime, filtered$Sub_metering_2, col="red", type="l")
    lines(filtered$ntime, filtered$Sub_metering_3, col="blue", type="l")

    # Now add the axis

    legend("topright",
           col = c("black", "red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty=c(1,1,1),
           pch=c(NA,NA,NA),
           cex=1.2,
           pt.cex=1
           )

    dev.copy(png,file="plot3.png")
    dev.off()
}
