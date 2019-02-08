obterFreqTabela = function(tabela)
{
    vetorFreq = c()
    for(i in 1:length(tabela))
        vetorFreq = c(vetorFreq,tabela[[i]][1])
    return(vetorFreq)
}

arredondarEmX = function(numArrendodado,x)
{
  x*(numArrendodado%/%numArrendodado + as.logical(numArrendodado%%x))
}

#mediaNaoContandoZeros = function(vetorLinhaTabela)
#{
#    vetorMedia=c()
    
    
#    for(i in length(vetorLinhaTabela))
#    {
#        if(vetorLinhaTabela[1,][i]!=0)
#        {
#            numeroASerAcrescentado = as.numeric(names(vetorLinhaTabela[1,][i]))
#            numeroASerAcrescentado = numeroASerAcrescentado * vetorLinhaTabela[1,][i]
#            vetorMedia = c(vetorMedia,numeroASerAcrescentado)
#        }
#    }
#    vetorMedia
#    media = mean(vetorMedia)
#    return(media)
#}
