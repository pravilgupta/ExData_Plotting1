df<-read.table("household_power_consumption.txt",header=T,na.strings="?",sep=';')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

wdf<-df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]
attach(wdf)

png("plot4.png")
par(mfrow=c(2,2))

plot(datetime,Global_active_power,type='l',xlab='',ylab="Global Active Power (kilowatts)")

plot(datetime,Voltage,type='l')

plot(datetime,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(datetime,Sub_metering_2,type='l',col="red")
lines(datetime,Sub_metering_3,type='l',col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, box.lwd=0)
plot(datetime,Global_reactive_power,type='l')
dev.off()

detach(wdf)
