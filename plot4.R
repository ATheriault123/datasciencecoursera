data <- read.delim("C:/Users/AMThe/AppData/Roaming/Microsoft/Windows/Network Shortcuts/exdata_data_household_power_consumption/household_power_consumption.txt", 
                   col.names = c('Date','Time','Global_act_power','Global_react_power','Voltage','Global_intensity','sub_metering_1','sub_metering_2','sub_metering_3'),
                   header = TRUE,
                   sep = ';')

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

sub <- data %>% 
  filter(data$Date>=ymd('2007-02-01') & data$Date<=ymd('2007-02-02'))

sub$Global_act_power <- as.numeric(sub$Global_act_power)
sub$Voltage <- as.numeric(sub$Voltage)

png('C:/Users/AMThe/OneDrive/Documents/datasciencecoursera/plot4.png', width=480, height=480)

par(mfrow=c(2,2))

plot(sub$Global_act_power, lwd=1, type='l', xaxt='n', ylab='Global Active Power (kilowatts)', xlab='')
axis(side=1, at=c(0,1440,2880), labels = c('Thu','Fri','Sat'))


plot(sub$sub_metering_1, type='l', ylab='Energy sub metering', xaxt='n', xlab='', lwd=1)
lines(sub$sub_metering_2, col='red', lwd=2)
lines(sub$sub_metering_3, col='blue', lwd=2)
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('Black','Red','Blue'), lty=1, cex=1)
axis(side=1, at=c(0,1440,2880), labels = c('Thu','Fri','Sat'))



plot(sub$Voltage, type='l', ylab='Voltage', xlab='datetime' ,xaxt='n', lwd=1)
axis(side=1, at=c(0,1440,2880), labels = c('Thu','Fri','Sat'))


plot(sub$Global_react_power, type='l', ylab='Global_reactive_power', xlab='datetime' ,xaxt='n', lwd=1)
axis(side=1, at=c(0,1440,2880), labels = c('Thu','Fri','Sat'))

dev.off()
