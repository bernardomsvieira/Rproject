#Importando Util
source('/home/bmsv/Desenvolvimento/R/workspace/primeiroProjetoR/utils.r')

#Lendo o CSV
bundesligaData = read.csv("Bundesliga.csv")

#Obter dados Referentes ao Ultimo ano
ultimoAno = max(bundesligaData[7])
ultimoAno = 2000
bundesligaDataUltAno = subset(bundesligaData,Year==ultimoAno)


#Obter Soma dos Gols fora e dentro de casa
somaGolsDentro = sum(bundesligaDataUltAno[4])
somaGolsFora = sum(bundesligaDataUltAno[5])
somaGolsDentro
somaGolsFora

#Obter número de times
tabelaBundUltAnoTimeCasa = table(bundesligaDataUltAno$HomeTeam,bundesligaDataUltAno$HomeGoals)
tabelaBundUltAnoTimeFora = table(bundesligaDataUltAno$AwayTeam,bundesligaDataUltAno$AwayGoals)
tabelaBundUltAnoTimeFora

#Obter a soma de gols para cada Time
vetorSomaGolsComZeroTimeCasa = c()
vetorSomaGolsComZeroTimeFora= c()
somaTimeCasa = 0
somaTimeFora = 0
for(i in 1:length(tabelaBundUltAnoTimeCasa[,1]))
{
    for(j in 1:6)
    {
        somaTimeCasa = somaTimeCasa + ((j-1)*tabelaBundUltAnoTimeCasa[i, ][j])
        somaTimeFora = somaTimeFora + ((j-1)*tabelaBundUltAnoTimeFora[i, ][j])
    }
    vetorSomaGolsComZeroTimeCasa[i] = somaTimeCasa
    vetorSomaGolsComZeroTimeFora[i] = somaTimeFora
    
    somaTimeCasa = 0
    somaTimeFora = 0
}

vetorSomaGolsSemZeroCasa = c()
vetorSomaGolsSemZeroFora = c()

for(i in 1:length(vetorSomaGolsComZeroTimeCasa)){
    if(vetorSomaGolsComZeroTimeCasa[i]!=0)
            vetorSomaGolsSemZeroCasa = c(vetorSomaGolsSemZeroCasa,vetorSomaGolsComZeroTimeCasa[i])
    
    if(vetorSomaGolsComZeroTimeFora[i]!=0)
            vetorSomaGolsSemZeroFora = c(vetorSomaGolsSemZeroFora,vetorSomaGolsComZeroTimeFora[i])
}



#Obter media de gols
partidasUltAno = length(bundesligaDataUltAno[[1]])
mediaGolsPartDentro = (somaGolsDentro)/partidasUltAno
mediaGolsPartFora = (somaGolsFora)/partidasUltAno

#Graficos
#Grafico 1-2 -> Media de Gols  de Casa e Gols por times
par(mfrow=c(2,1),cex = 0.5)

fbundesligaCasa = factor(bundesligaDataUltAno$HomeTeam)
fbundesligaFora = factor(bundesligaDataUltAno$AwayTeam)
bpCasa = barplot(vetorSomaGolsSemZeroCasa,xaxt="none",main=paste("Gols dentro de casa por times ano ",ultimoAno,"-", ultimoAno+1),ylab="Gols",ylim=c(0,50))
axis(1,bp,labels=levels(fbundesligaCasa),las=2,cex.axis=0.6)
legend("top",legend=c(paste("Media de gols por partida:",format(round(mediaGolsPartDentro,2),format="f"))))


bpFora = barplot(vetorSomaGolsSemZeroFora,xaxt="none",main=paste("Gols fora de casa por times ano ",ultimoAno,"-", ultimoAno+1),ylab="Gols",ylim=c(0,50))
axis(1,bp,labels=levels(fbundesligaFora),las=2,cex.axis=0.6)
legend("top",legend=c(paste("Media de gols por partida:",format(round(mediaGolsPartFora,2),format="f"))))


