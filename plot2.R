df<-read.table("household_power_consumption.txt",header=T,na.strings="?",sep=';')
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
df$datetime <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")

wdf<-df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]
attach(wdf)
png("plot2.png")
plot(datetime,Global_active_power,type='l',xlab='',ylab="Global Active Power (kilowatts)")
dev.off()
detach(wdf)
