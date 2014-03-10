
# comand for generate scaffold
rails g model line number:string name:string company:string card_price:decimal money_price:decimal time_to_go:time time_to_back:time 
rails generate model dayofweek day:string direction:string bustime:references
rails generate model hour value:time 
rails generate model label value:string

rails g model reference
rails g model route 
rails g model place name:string


# remove the first character:
# t.slice!(0)
# Resolver problema com time que aumenta em 2 horas apos inserir tempo de ida e tempo de volta
# Ao inserir os dias da semana e direção checar antes se o tamanho do arranjo de horarios se ele é igual a zero não inserir o dia da semana, ver se como inserir o dia da semana e os horarios como has_many e belongs_to
# separar as partes do dia da semana por dayofweek.strip(" - ")
