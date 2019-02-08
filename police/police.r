dadosPolicia = read.csv('/home/bmsv/Desenvolvimento/R/workspace/police/MplsStops.csv')

dadosPoliciaTrafico = subset(dadosPolicia,problem=='traffic')

tabelaRaca = table(dadosPoliciaTrafico[["race"]])
tabelaRaca


bpDadosPoliciaTrafico = barplot(tabelaRaca,main="Numero de Pessoas que traficam por Etnia",xaxt="none")
axis(1,at=bpDadosPoliciaTrafico,labels=levels(dadosPoliciaTrafico[["race"]]),las=2,cex.axis=0.7)
