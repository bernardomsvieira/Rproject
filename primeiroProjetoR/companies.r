dadosCompanias = read.csv("Forbes2000.csv")
source('/home/bmsv/Desenvolvimento/R/workspace/companias/utils.r')

tabelaDadosPorPaises = table(dadosCompanias[["country"]])
limMaxY = max(tabelaDadosPorPaises)
limMaxYArredondado = arredondarEmX(limMaxY,200)

#Gráfico empresas e países
plot(tabelaDadosPorPaises,main="Empresas por Paises",las=2,ylim=c(0,limMaxYArredondado),col=rainbow(length(tabelaDadosPorPaises)))

#Grafico empresas mais valiosas e sua categoria
tabelaCategoriaValor = table(dadosCompanias[["category"]],dadosCompanias[["marketvalue"]])
mediaValorCompanias = c()


for(i in 1:length(tabelaCategoriaValor[,1]))
{    
    vetorMedia=c()
    for( j in 1:length(tabelaCategoriaValor[i,]))
    {
         
         if(tabelaCategoriaValor[i,][j]!=0)
         {
            numeroASerAcrescentado = as.numeric(names(tabelaCategoriaValor[i,][j]))
            
            
            frequencia = tabelaCategoriaValor[i,][j]
            
            for( k in 1:frequencia)
                vetorMedia = c(vetorMedia,numeroASerAcrescentado)
            
         }
         
    }
    media = mean(vetorMedia)
    #print(media)
    mediaValorCompanias[i] = media
}


maxLimY = max(mediaValorCompanias)
maxLimYArrend = arredondarEmX(maxLimY,10)

bpMediaValorCompanias = barplot(mediaValorCompanias,xaxt="none",main="Media de Valor por Categorias",ylim=c(0,maxLimYArrend))
axis(1,at=bpMediaValorCompanias,labels=levels(dadosCompanias[["category"]]),las=2,cex.axis=0.5)

paisASerAvaliado = readline(prompt="Digite um pais: ")

dadosPorPais = subset(dadosCompanias,country==paisASerAvaliado)
attach(dadosPorPais)
dadosPorPaisLucro = dadosPorPais[order(-profits),]

valor10MaioresLucros = c()
nomesEmpresas10MaioresLucros = c()

for(i in 1:10)
{
    valor10MaioresLucros = c(valor10MaioresLucros,dadosPorPaisLucro[[7]][i])
    nomesEmpresas10MaioresLucros = c(nomesEmpresas10MaioresLucros,as.character(dadosPorPaisLucro[[3]][i]))
}


bp10CompaniasMaisLucrativa = barplot(valor10MaioresLucros,xaxt="none",main=paste("10 Empresas Mais Lucrativas ",paisASerAvaliado))
axis(1,at=bp10CompaniasMaisLucrativa,labels=nomesEmpresas10MaioresLucros,las=2,cex.axis=0.7)

detach(dadosPorPais)


