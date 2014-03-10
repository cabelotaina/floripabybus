require 'iconv'
require 'hpricot'
ic = Iconv.new("UTF-8", "ISO-8859-1")
files = Dir["/home/maurilio/code/floripabybus/bus/horarios/linhas/*"]
files.each do |file|
	  html = open(file) { |f| Hpricot(ic.iconv(f.read)) }
 for i in 3..13
	    nomes = html.search("//table[#{i}]/tr[1]/td[1]/h1/text()").inner_text
	       if (!nomes.empty? and !(nomes.include? "Legenda"))
                       nomes = nomes.gsub("->","=>")
                       nomes = nomes.gsub("-","#")
                       nomes = nomes.split(/#/)
              	       #day = nomes[0].squish
              	       p nomes[0].squish
                       #path = nomes[1].squish
                       p nomes[1].squish
                       #direction = ""
                       #if !(nomes[2] == nil)
                        #direction =  nomes[2].squish
                        p nomes[2].squish
                       #end
                       # @bus.dayofweeks.new(:day => day, :path => path, :direction => direction).save
	       end
 i+=2
 end
end
