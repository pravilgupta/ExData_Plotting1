df<-read.table("household_power_consumption.txt",header=T,na.strings="?",sep=';')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

wdf<-df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]
attach(wdf)

png("plot3.png")
plot(datetime,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(datetime,Sub_metering_2,type='l',col="red")
lines(datetime,Sub_metering_3,type='l',col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1)
dev.off()

detach(wdf)
