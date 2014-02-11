library(XML)

# função auxiliar

source("scrap_bus_fields.R")
source("scrap_bus_list.R")


# raspando infos dos onibus

print ("raspando infos dos onibus")

linhas = scrap_fields("//td[2]/h1/text()")
tarifa_cartao = scrap_fields("//div[4]/table[1]/tr[2]/td[2]/text()")
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

dia_da_semana.B = scrap_fields("//table[5]/tr[1]/td[1]/h1/text()")
horarios.B = scrap_list("//table[6]/tr[*]/td[*]/p/text()")

dia_da_semana.C = scrap_fields("//table[7]/tr[1]/td[1]/h1/text()")
horarios.C = scrap_list("//table[8]/tr[*]/td[*]/p/text()")

dia_da_semana.D = scrap_fields("//table[9]/tr[1]/td[1]/h1/text()")
horarios.D = scrap_list("//table[10]/tr[*]/td[*]/p/text()")

dia_da_semana.E = scrap_fields("//table[11]/tr[1]/td[1]/h1/text()")
horarios.E = scrap_list("//table[12]/tr[*]/td[*]/p/text()")

dia_da_semana.F = scrap_fields("//table[13]/tr[1]/td[1]/h1/text()")
horarios.F = scrap_list("//table[14]/tr[*]/td[*]/p/text()")

# fazendo cbind e guardando no objeto total

total = cbind(linhas,tarifa_cartao,tarifa_dinheiro)


