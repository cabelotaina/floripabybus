require 'iconv'
require 'hpricot'
ic = Iconv.new("UTF-8", "ISO-8859-1")
files = Dir["/home/maurilio/code/floripabybus/bus/horarios/linhas/*"]
files.each do |file|
 html = open(file) { |f| Hpricot(ic.iconv(f.read)) }
 for i in 3..13
  nomes = html.search("//table[#{i}]/tr[1]/td[1]/h1/text()").inner_text
  horarios = html.search("//table[#{i+1}]/tr[*]/td[*]/p").inner_text
  # See the best way to insert legends with time
  #legendas = html.search("//table[#{i+1}]/tr[*]/td[*]/text()").inner_text
  if (!nomes.empty? and !(nomes.include? "Legenda") and !(horarios==""))
   nomes = nomes.gsub("->","=>")
   nomes = nomes.gsub("-","#")
   nomes = nomes.split(/#/)
   #p nomes[0].squish
   #p nomes[1].squish
   #p nomes[2].squish
   horarios.split(/(..:..)/).reject! { |c| c.empty? }.each do
    |hour|
    h, m = hour.split(":")
    t = Time.new(year=Time.now.year, month=Time.now.month, day=Time.now.day, hour=h, min=m, sec=nil, utc_offset=nil)
    p t
   end
   #p legendas
  end
  i+=2
 end
end
