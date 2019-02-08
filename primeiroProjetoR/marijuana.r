marijuanaArrest = read.csv("Arrests.csv")
source('/home/bmsv/Desenvolvimento/R/workspace/primeiroProjetoR/utils.r')

userYear = readline(prompt="Enter the year: ")
if(userYear!=""){
    marijuanaArrestUserYear = subset(marijuanaArrest,year==userYear)
} else{
    marijuanaArrestUserYear = marijuanaArrest
}
marijuanaArrestBlackNoEmployed = subset(marijuanaArrestUserYear,colour=="Black" & employed=="No")
tabelaMarijuanaArrestBlackNoEmployed = table(marijuanaArrestBlackNoEmployed$age)

maxAgeBlack = max(tabelaMarijuanaArrestBlackNoEmployed)
maxAgeRoundBlack = arrendodarEm10(maxAge)

plotMarijuanaBlackNoEmployed = barplot(tabelaMarijuanaArrestBlackNoEmployed,ylim=c(0,maxAgeRoundBlack),main="Negros sem emprego presos",xlab="Idade",ylab="Presos")
#axis(1,plotMarijuanaBlackNoEmployed,labels=levels(marijuanaArrestBlackNoEmployed$age))

marijuanaArrestWhiteEmployed = subset(marijuanaArrestUserYear, colour=="White" & employed=="Yes")
tabelaMarijuanaArrestWhiteEmployed = table(marijuanaArrestWhiteEmployed$age)

maxAgeWhite = max(tabelaMarijuanaArrestWhiteEmployed)
maxAgeRoundWhite = arrendodarEm10(maxAgeWhite)

plotMarijuanaWhiteEmployed = barplot(tabelaMarijuanaArrestWhiteEmployed,ylim=c(0,maxAgeRoundWhite),main="Branco com emprego presos",ylab="Presos",xlab="Idade")

tableMarijuanaReleasedEmployed = table(marijuanaArrestUserYear$released,marijuanaArrestUserYear$colour)
barplot(tableMarijuanaReleasedEmployed,main="Pessoas Liberadas e Etnia",col=c("darkblue","red"))
legend("topleft",rownames(tableMarijuanaReleasedEmployed),col=c("darkblue","red"), pch=15)

tableMarijuanaCitizen = table(marijuanaArrestUserYear$citizen)
pie(tableMarijuanaCitizen,labels="",main="Relação Pessoas Presas e Cidadoes",col=c("gray","blue"))
legend("right",title="Cidadao",rownames(tableMarijuanaCitizen),fill=c("gray","blue"))

