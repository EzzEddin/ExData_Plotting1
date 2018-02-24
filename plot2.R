# Generating the second plot
dat <- read.table("household_power_consumption.txt"
                  , header = TRUE, sep = ";", na.strings = "?")
datReq <- subset(dat, Date %in% "2/2/2007" | Date %in% "1/2/2007")
datReq$Date <- as.Date(datReq$Date, format = "%d/%m/%Y")
datReq$dt <- with(datReq, paste(Date, Time))
datReq$dt <- as.POSIXct(datReq$dt)
with(datReq, plot(dt, as.numeric(Global_active_power), xlab = ""
     , ylab = "Global Active Power (killowatts)", type = "l"))
dev.copy(png, file = "plot2.png")
dev.off()