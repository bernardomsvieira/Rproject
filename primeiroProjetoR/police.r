library(plotrix)
policeCsv = read.csv("MplsStops.csv")

par(mfrow=c(2,1))
policeDataSuspicius = subset(policeCsv, problem=="suspicious" & personSearch=="YES")
plotPolice = plot(policeDataSuspicius$neighborhood,xaxt="none",main="Procura de Suspeitos")
axis(1,plotPolice,labels=levels(policeDataSuspicius$neighborhood),las=2,cex.axis=0.6)

policeDataTraffic = subset(policeCsv, problem=="traffic" & vehicleSearch=="YES")
plotTraffic= plot(policeDataTraffic$neighborhood,xaxt="none",main="Procura de Veículos")
axis(1,plotTraffic,labels=levels(policeDataTraffic$neighborhood),las=2,cex.axis=0.6)

policeAllCrimes = subset(policeCsv,personSearch=="YES" | vehicleSearch=="YES")
plotCrimesNeighborhood = plot(policeAllCrimes$neighborhood,xaxt="none",main="Crimes por Bairro")
axis(1,plotCrimesNeighborhood,labels=levels(policeAllCrimes$neighborhood),las=2,cex.axis=0.6)


tabelaPieRaces = table(policeCsv$race)
policePieRaces = pie3D(tabelaPieRaces,labels=names(tabelaPieRaces),explode=0.1,col=rainbow(length(tabelaPieRaces)),main="Crimes por Raça")
