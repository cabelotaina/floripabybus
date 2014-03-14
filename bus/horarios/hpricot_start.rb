require 'iconv'
require 'hpricot'
ic = Iconv.new("UTF-8", "ISO-8859-1")
files = Dir["/home/maurilio/code/onibus_floripa/bus/horarios/linhas/*"]
files.each do |file|
  html = open(file) { |f| Hpricot(ic.iconv(f.read)) }
  t = html.search("//td[2]/h1/text()").inner_text.squish.split(/\-([^-]*)$/)
  tt = t[0].split(' - ', 2)
  info = [tt[0], tt[1], t[1]]
  card_price = html.search("//div[4]/table[1]/tr[2]/td[2]/text()").inner_text.squish.gsub(/^.../,"").gsub(/,/,".").to_d
  money_price = html.search("//tr[2]/td[4]/text()").inner_text.squish.gsub(/^.../,"").gsub(/,/,".").to_d
  trip_time = html.search("//div[4]/table[1]/tr[3]/td[2]/text()").inner_text.squish.chomp(" min").split(":")
  if trip_time.length == 1
   trip_time.push trip_time[0] 
   trip_time[0] = 0
   if trip_time[1] == "60"
    trip_time[0] = "1"
    trip_time[1] = "0"
   end
  end
   trip_time = Time.new(2000, 1, 1, 0,0 , 0, "+00:00").change( hour: trip_time[0].to_i, min: trip_time[1].to_i)
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
  @bus = Line.new(:number => info[0].squish.to_s, :name => info[1].squish.to_s,:company => info[2].squish.to_s, :card_price => card_price , :money_price => money_price, :time_to_go => trip_time, :time_to_back => time_back)
@bus.save
 for i in 3..13
  nomes = html.search("//table[#{i}]/tr[1]/td[1]/h1/text()").inner_text
  horarios = html.search("//table[#{i+1}]/tr[*]/td[*]/p").inner_text
  if (!nomes.empty? and !(nomes.include? "Legenda") and !(horarios == ""))
   nomes = nomes.gsub("->","=>")
   nomes = nomes.gsub("-","#")
   nomes = nomes.split(/#/)
   day = nomes[0].squish
   path = nomes[1].squish
   direction = ""
   if !(nomes[2] == nil)
    direction =  nomes[2].squish
   end
   @dayofweek = @bus.dayofweeks.new(:day => day, :path => path, :direction => direction)
   @dayofweek.save
   horarios.split(/(..:..)/).reject! { |c| c.empty? }.each do
    |hour|
    h, m = hour.split(":")
    t = Time.new(year=Time.now.year, month=Time.now.month, day=Time.now.day, hour=h, min=m, sec=nil, utc_offset=nil)
    @dayofweek.hours.new(:time => t).save
   end
  end
 i+=2
 end
end
