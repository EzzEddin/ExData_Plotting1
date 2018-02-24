# Generating the third plot
dat <- read.table("household_power_consumption.txt"
                  , header = TRUE, sep = ";", na.strings = "?")
datReq <- subset(dat, Date %in% "2/2/2007" | Date %in% "1/2/2007")
datReq$Date <- as.Date(datReq$Date, format = "%d/%m/%Y")
datReq$dt <- with(datReq, paste(Date, Time))
datReq$dt <- as.POSIXct(datReq$dt)

with(datReq,
     plot(dt, Sub_metering_1, xlab = ""
                  , ylab = "Energy sub metering", type = "l"))
with(datReq,
     points(dt, Sub_metering_2, xlab = "", col = "red"
          , ylab = "Energy sub metering", type = "l"))
with(datReq,
     points(dt, Sub_metering_3, xlab = "", col = "blue"
            , ylab = "Energy sub metering", type = "l"))
legend("topright", pch = 1, col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()