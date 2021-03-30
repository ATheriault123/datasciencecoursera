install.packages('dplyr')
install.packages('tidyr')
library(dplyr)
library(tidyr)






url1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

file1 = read.csv(url1)

str(file1)


spl <- strsplit(file1[, 'WGTP'], '\\wgtp')
spl


?strsplit



file1[3, "WGTP"]


sapply(strsplit(as.character(file1), 'wgtp'), '[', 1)


gsub("\\", "", file1[0, ])


file1[0, ]


?'['


m <- matrix(1:25, nrow=5, ncol=5)
m<-as.data.frame(m)
m


strsplit(names(file1), 'wgpt')[123]

View(file2)


url2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file2 = read.csv(url2)

View(arrange(file2, desc(X.3)))

x <- as.numeric(gsub(',','', file2$X.3))

xy <- x[!is.na(x)]

xy

xy <- as.data.frame(xy)

mean(xy[0:190,1])

url3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
file3 = read.csv(url3)

total = merge(file2, file3, by.x = 'X', by.y = 'CountryCode')
grep('Fiscal year end: June', file3$Special.Notes)

View(file2)

install.packages('quantmod')
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)


install.packages('lubridate')
library(lubridate)


data <- ymd(sampleTimes)
sum(year(data) == '2012')
