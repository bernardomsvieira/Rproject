vetorComum <- c(3,6,9,12)
print(vetorComum)

seqCriadaUmAUm <- 2:10
print(seqCriadaUmAUm)

seqCriadaDoisADois <- seq(4,10,by=2)
print(seqCriadaDoisADois)

#Tudo vira String
s <- c('Nome',TRUE,5)
print(s)

#Indexação
t <- c("seg","ter","qua","qui","sex")
k <- t[c(2,3,5)]
i <- t[1]
print(k)
print(i)

#Lista
listaBasica <- list(c(1,3,5),"Bernardo",27)
print(listaBasica[1])

listaNumericaUm <- list(c(2,4,6),4,17)
listaNumericaDois <- list("oi","Bernardo","27")
listaMerged <- merge(listaNumericaUm,listaNumericaDois)
print(listaMerged)

vetorDerivadoLista <- unlist(listaNumericaUm)
print(vetorDerivadoLista)

#Matrizes matrix(data[vetor usado para criar matrix], nrow, ncol, byrow, dimnames)
M <-matrix(c(3:14), nrow=4, byrow=TRUE)
print(M)
print(M[4,3])

#Uso de loops
vetorPesquisa <- 1:6
i <- 1
while(TRUE){
    if(vetorPesquisa[i] == 4)
    {
        print("Encontrou o 4")
        break
    }
    i <- i+1
}

#LENDO CSV

#setwd("/home/bmsv/Desenvolvimento/R/workspace/primeiroProjetoR")
#print(getwd())
#titanic <- read.csv("TitanicSurvival.csv")
#print(titanic[1, ])
#pessoasJovens <- subset(titanic,age>= 18 & age<=24)
#idadePessoasJovens <- pessoasJovens[4]

#Pega todos os elemento da coluna 1
#idadePessoasJovensOrdenadas <- sort(idadePessoasJovens[,1])
#print(idadePessoasJovensOrdenadas)
#tabela <- table(idadePessoasJovensOrdenadas)
#vetorPGrafPizza <-c(tabela[[1]][1])
#for(i in 2:11)
#{
#    vetorPGrafPizza <- c(vetorPGrafPizza,tabela[[i]][1])

#}
#pie(vetorPGrafPizza,c("18","18.5","19","20","20.5","21","22","22.5","23","23.5","24"))
#
#salarios <- read.csv("Salaries.csv")
#salarios
#salariosHomens <- subset(salarios,sex=="Male")
#salariosMulheres <- subset(salarios,sex=="Female")
#plot(salariosHomens[7])
#plot(salariosMulheres[7])
#salariosHomens
#disciplinas <- salarios[3]
#print(disciplinas)
#tabela <- table(disciplinas)
#vetorD = c()
#for(i in 1:2)
#{
#    vetorD <- c(vetorD,tabela[[i]][1])
#}
#barplot(vetorD,width=1,names.arg=c("A","B"),col=c("red","blue"),xlab="Disciplinas",ylab="Quantidade",ylim=c(0,400))
#legend("topright",legend=c("A","B"),fill= c("red","blue"))
#salariosProf <- c(salarios[7])
#mean(salariosProf[[1]])

source('/home/bmsv/Desenvolvimento/R/workspace/primeiroProjetoR/utils')
require(stats)
estacaoNuclear = read.csv("nuclear.csv")
estacaoNuclear[[3]]
estacaoNuclearSort = sort(estacaoNuclear[[3]])
tabelaEstacaoNuclear = table(estacaoNuclear[[3]])
estacaoNuclearF = factor(estacaoNuclear[[3]])


tabelaEstacaoNuclear
vetorFrequencia = obterFreqTabela(tabelaEstacaoNuclear)
vetorFrequencia
vetorSomaFreq = c(vetorFrequencia[1])
for(i in 2:length(vetorFrequencia))
vetorSomaFreq[i] = vetorFrequencia[i]+vetorSomaFreq[i-1]


plot(vetorSomaFreq,type="o",xaxt="none",col="blue", main="Crescimento de Usinas Nucleares",xlab="Anos",ylab="Número de Usinas")
axis(1,at=1:length(vetorSomaFreq),labels=names(tabelaEstacaoNuclear),las=2)
lines(seq(1,30,by=1.6),type="o",pch=22,col="red")
legend("topleft",legend=c("Realidade","Previsão"),fill=c("blue","red"))
png("CrescimentoUsinasNucleares.png")
