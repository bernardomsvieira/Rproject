dadosTerrorismo = read.csv('incidents.byCountryYr.csv')

#anoEscolhido = readline(prompt="Insira o ano: ")

#dadosTerrorismoAno = subset(dadosTerrorismo,iyear==anoEscolhido & Freq!=0)
#bpDadosTerrorismoAno = barplot(dadosTerrorismoAno[["Freq"]],xaxt="none",main=paste("Terrorismo ano ",anoEscolhido))
#axis(1,at=bpDadosTerrorismoAno,labels=dadosTerrorismoAno[["country_txt"]],las=2,cex.axis=0.5)

dadosSomaTerrorismo = table(dadosTerrorismo[["country_txt"]],dadosTerrorismo[["Freq"]])

vetorSoma = c()
#dadosSomaTerrorismo[,1][] num paises
#dadosSomaTerrorismo[1,][]

for(i in 1:length(dadosSomaTerrorismo[,1][])){
    soma = 0
    for(j in 1:length(dadosSomaTerrorismo[1,][])){
        if(dadosSomaTerrorismo[i,][j]!=0){
            numeroASerSomado = as.numeric(names(dadosSomaTerrorismo[i,][j]))
            soma = soma + numeroASerSomado
        }
    }
    vetorSoma[i] = soma
}


bpSomaTerrorismo = barplot(vetorSoma,xaxt="none",main="Total de Terrorismos por pais")
axis(1,at=bpSomaTerrorismo,labels=levels(dadosTerrorismo[["country_txt"]]),las=2,cex.axis=0.5)
