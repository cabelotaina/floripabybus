library(XML)

# função auxiliar

source("scrap_bus_fields.R")
source("scrap_bus_list.R")


# raspando infos dos onibus

print ("raspando infos dos onibus")

linhas = scrap_fields("//td[2]/h1/text()")
linhas.char=sapply( linhas, function(x) gsub("^.", "", as(x,"character")))
linhas.char=sapply( linhas.char, function(x) gsub(".$", "", as(x,"character")))

tarifa_cartao = scrap_fields("//div[4]/table[1]/tr[2]/td[2]/text()")
#tarifa_cartao.char = sapply(tarifa_cartao 

tarifa_dinheiro = scrap_fields("//tr[2]/td[4]/text()")


tempo_medio_ida = scrap_fields("//tr[3]/td[2]/text()")


tempo_medio_volta = scrap_fields("//tr[3]/td[4]/text()")


extensao_ida = scrap_fields("//tr[4]/td[2]/text()")


extensao_volta = scrap_fields("//tr[4]/td[4]/text()")


notas_da_linha = scrap_fields("//tr[5]/td[2]/text()")

# raspando os horarios

print("raspando horarios")

dia_da_semana.A = scrap_fields("//table[3]/tr[1]/td[1]/h1/text()")
horarios.A = scrap_list("//table[4]/tr[*]/td[*]/p/text()")
legenda.A = scrap_list("//table[4]/tr[*]/td[*]/text()")

dia_da_semana.B = scrap_fields("//table[5]/tr[1]/td[1]/h1/text()")
horarios.B = scrap_list("//table[6]/tr[*]/td[*]/p/text()")
legenda.B = scrap_list("//table[6]/tr[*]/td[*]/text()")

dia_da_semana.C = scrap_fields("//table[7]/tr[1]/td[1]/h1/text()")
horarios.C = scrap_list("//table[8]/tr[*]/td[*]/p/text()")
legenda.C = scrap_list("//table[8]/tr[*]/td[*]/text()")

dia_da_semana.D = scrap_fields("//table[9]/tr[1]/td[1]/h1/text()")
horarios.D = scrap_list("//table[10]/tr[*]/td[*]/p/text()")
legenda.D = scrap_list("//table[10]/tr[*]/td[*]/text()")

dia_da_semana.E = scrap_fields("//table[11]/tr[1]/td[1]/h1/text()")
horarios.E = scrap_list("//table[12]/tr[*]/td[*]/p/text()")
legenda.E = scrap_list("//table[12]/tr[*]/td[*]/text()")

dia_da_semana.F = scrap_fields("//table[13]/tr[1]/td[1]/h1/text()")
horarios.F = scrap_list("//table[14]/tr[*]/td[*]/p/text()")
legenda.F = scrap_list("//table[14]/tr[*]/td[*]/text()")

# fazendo cbind e guardando no objeto total
print ( "juntando as tabelas" )
total = cbind(linhas,tarifa_cartao,tarifa_dinheiro,extensao_ida,extensao_volta,tempo_medio_ida,tempo_medio_volta,notas_da_linha)

#teste = sapply(total, function(x) as(x, "character"))
# Muito bom extrai agora vamos ver se consigo guardar
teste = sapply(total[1,1:8], function(x) as(x, "character"))

# escrevendo em arquivo

write(teste, "output.txt", sep="\n")

# Funciona muito bem para extrair o numero do onibus
# > m = regexec("[1-9][1-9][1-9]", teste[1])
# > regmatches(teste[1],m)

# Assim podemos adquirir todos os numeros dos onibus
# > numeros = total[,1]
# > numeros = sapply(numeros, function(x) as(x, "character"))
# > sapply(numeros, function(x) {m = regexec("[1-9][1-9][1-9]", x); regmatches(x,m)})

# permite subdividir uma string de acordo com determinado caracter:
# strsplit(string," ") 

# removendo o espaço do começo da linha:
# > gsub("^.", "", linhas_aux) # remove leading white space
# removendo o espaço do final da linha:
# > gsub(".$", "", linhas_aux) # remove trailing white space

# Note que cada ponto representa um caracter a menos e depois podemos concatenar com uma string nova gerando a seed para o rails
# > gsub("^.......", 'Bus(:name => "', linhas_aux) # remove leading white space
# https://stat.ethz.ch/pipermail/r-help/2003-February/030062.html

linhas_char=sapply( linhas, function(x) gsub("^.", "", as(x,"character")))
linhas_char=sapply( linhas_char, function(x) gsub(".$", "", as(x,"character")))

numeros = sapply(linhas_char, function(x) {m = regexec("[0-9][0-9][0-9]|[0-9][0-9]", x); regmatches(x,m)})


# onibus com 100 horarios no horarios.A
# x = 0 ; for ( i in 1:length(horarios.A)) if  (length(horarios.A[[i]]) > x ) {x = length(horarios.A[[i]]); print(i)}
# 210 - Canasvieiras - direto - Canasvieiras Transportes

# Onibus Acima de 100 horarios no horarios.B
# x = 0 ; for ( i in 1:length(horarios.B)) if  (length(horarios.B[[i]]) >100 ) {x = length(horarios.A[[i]]); print(i)}

