airPassangersData = read.csv("AirPassengers.csv")

for(i in 1:length(airPassangersData$time))
   airPassangersData[i,][2] = round(airPassangersData[i,][2],1)


grafico = plot(airPassangersData$value,xaxt="none",type="o")
axis(1,at=1:length(airPassangersData$time),labels=airPassangersData$time,cex.axis=0.6,las=2)
