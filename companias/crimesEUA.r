dadosCrimes = read.csv("USArrests.csv")
par(mfrow=c(1,1))
vetorSomaCrimes = c()



for(i in 1:length(dadosCrimes[,1]))
{
    pop = as.numeric(dadosCrimes[i,][4])
    soma = sum(dadosCrimes[i,][2],dadosCrimes[i,][3],dadosCrimes[i,][5])
    
    vetorSomaCrimes[i] = soma/pop
}

bpEstadosMaisCrimes = barplot(vetorSomaCrimes,main="Estados com mais crimes",xaxt="none")
axis(1,at=bpEstadosMaisCrimes,labels=dadosCrimes[,1],las=2,cex.axis=0.7)


bpCrimeAssassinato = barplot(dadosCrimes[,2],main="Estados com mais assassinato",xaxt="none")
axis(1,at=bpCrimeAssassinato,labels=dadosCrimes[,1],las=2,cex.axis=0.7)

bpCrimeAssalto = barplot(dadosCrimes[,3],main="Estados com mais assalto",xaxt="none")
axis(1,at=bpCrimeAssalto,labels=dadosCrimes[,1],las=2,cex.axis=0.7)

bpCrimeEstupro = barplot(dadosCrimes[,5],main="Estados com mais estupro",xaxt="none")
axis(1,at=bpCrimeEstupro,labels=dadosCrimes[,1],las=2,cex.axis=0.7)
