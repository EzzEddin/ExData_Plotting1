# Generating the first plot
dat <- read.table("household_power_consumption.txt"
                  , header = TRUE, sep = ";", na.strings = "?")
                  # , colClasses = c("Date", "POSIct", "numeric",
                  #                  "numeric", "numeric", "numeric",
                  #                  "numeric", "numeric", "numeric"))
datReq <- subset(dat, Date %in% "2/2/2007" | Date %in% "1/2/2007")
hist(as.numeric(datReq$Global_active_power), col = "red"
     , main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.copy(png, file = "plot1.png")
dev.off()

as.Date(datReq$Date[300])