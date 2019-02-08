dadosDrug = read.csv('/home/bmsv/Desenvolvimento/data-master/drug-use-by-age/drug-use-by-age.csv')


tabelaDrugAlcool = table(dadosDrug[["age"]],dadosDrug[["alcohol.use"]])


vetorValoresUso = c()
count = 1


for(i in 1:length(tabelaDrugAlcool[,1][]))
{
    for(j in 1:length(tabelaDrugAlcool[1,][]))
    {
        if(tabelaDrugAlcool[i,][j]!=0)
        {
            vetorValoresUso[count] = as.numeric(names(tabelaDrugAlcool[i,][j]))
            count=count+1
            break
        }
        
    }
}


bpUsoAlcool = barplot(dadosDrug[["alcohol.use"]],main="Consumo de Alcool por idade em %",
ylab="Consumo",xaxt="none")
axis(1,at=bpUsoAlcool,labels=levels(dadosDrug[["age"]]),cex.axis=0.5)
