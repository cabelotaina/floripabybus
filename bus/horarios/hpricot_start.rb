require 'iconv'
require 'hpricot'
ic = Iconv.new("UTF-8//IGNORE", "UTF-8")
files = Dir["/home/maurilio/code/onibus_floripa/bus/horarios/linhas/*"]
files.each do |file|
  html = open(file) { |f| Hpricot(ic.iconv(f.read)) }
  #ver qual é o probleme com o encode que esta sumindo com algumas letras - Onibus 212 é um bom exemplo
  t = html.search("//td[2]/h1/text()").inner_text.squish.reverse.split(/\-([^-]*)$/)
  tt = t[0].split(' - ', 2)
  info = [tt[0], tt[1], t[1]]
  p file
  p info[0]
  card_price = html.search("//div[4]/table[1]/tr[2]/td[2]/text()").inner_text.squish.gsub(/^.../,"").gsub(/,/,".").to_d
  money_price = html.search("//tr[2]/td[4]/text()").inner_text.squish.gsub(/^.../,"").gsub(/,/,".").to_d
  trip_time = html.search("//div[4]/table[1]/tr[3]/td[2]/text()").inner_text.squish.chomp(" min").split(":")
  p trip_time
  if trip_time.length == 1
   trip_time.push trip_time[0] 
   trip_time[0] = 0
   if trip_time[1] == "60"
    trip_time[0] = "1"
    trip_time[1] = "0"
   end
  end
   trip_time = Time.new(2000, 1, 1, 0,0 , 0, "+00:00").change( hour: trip_time[0].to_i, min: trip_time[1].to_i)
   p trip_time 
   time_back = html.search("//div[4]/table[1]/tr[3]/td[4]/text()").inner_text.squish.chomp(" min").split(":")
   p time_back
  if time_back.length == 1
   time_back.push time_back[0]
   time_back[0] = "0"
   if time_back[1] == "60"
    time_back[0] = 1
    time_back[1] = 0
   end
  end
   time_back = Time.new(2000, 1, 1, 0,0 , 0,"+00:00").change( hour: time_back[0].to_i, min: time_back[1].to_i)
   p time_back
  @bus = Busline.new(:number => info[0].to_s, :line => info[1].to_s,:company => info[2].to_s, :card_price => card_price , :money_price => money_price, :time_to_go => trip_time, :time_to_back => time_back).save
 for i in 3..13
   nomes = html.search("//table[#{i}]/tr[1]/td[1]/h1/text()").inner_text
   if (!nomes.empty? and !(nomes.include? "Legenda"))
	   nomes = nomes.split(" - ")
    Busdayofweek.new(:day => nomes[0], :direction => nomes[1], :busline_id =>@bus).save
   end
   i+=2
 end   
end

require 'iconv'
require 'hpricot'
ic = Iconv.new("UTF-8//IGNORE", "UTF-8")
files = Dir["/home/maurilio/code/onibus_floripa/bus/horarios/linhas/*"]
files.each do |file|
	  html = open(file) { |f| Hpricot(ic.iconv(f.read)) }
 for i in 3..13
	    nomes = html.search("//table[#{i}]/tr[1]/td[1]/h1/text()").inner_text
	       if (!nomes.empty? and !(nomes.include? "Legenda"))
		       p nomes
	       end
 i+=2
 end
end


# comand for generate scaffold
rails g scaffold busline number:string line:string company:string card_price:decimal money_price:decimal time_to_go:time time_to_back:time busdayofweek:references
rails generate scaffold busdayofweek day:string direction:string bustime:references
rails generate scaffold bustime time:time label:string
# remove the first character:
# t.slice!(0)
# Resolver problema com time que aumenta em 2 horas apos inserir tempo de ida e tempo de volta
# Ao inserir os dias da semana e direção checar antes se o tamanho do arranjo de horarios se ele é igual a zero não inserir o dia da semana, ver se como inserir o dia da semana e os horarios como has_many e belongs_to
# separar as partes do dia da semana por dayofweek.strip(" - ")
