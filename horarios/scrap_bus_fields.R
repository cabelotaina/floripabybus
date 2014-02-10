scrap_fields <- function(xpath){ 
	bus_data = NULL;
	for (i in 1:9 ) { 
	bus_data[i] = xpathSApply(
				htmlParse( 
					  paste("linha_det.php_00",
						i,
						".html", 
						sep = ""
						) , 
					  encoding = "UTF8" 
					  ),
				xpath
				)
	}
	for (i in 10:99 ) { 
		bus_data[i] = xpathSApply(
					htmlParse( 
						  paste(
							"linha_det.php_0",
							i,
							".html", 
							sep = ""
							) , 
						  encoding = "UTF8" 
						  ),
					xpath
					)
	}
	for (i in 100:209){
		bus_data[i] = 
		xpathSApply(
			    htmlParse( 
				      paste(
					    "linha_det.php_",
					    i,
					    ".html", 
					    sep = "") , 
				      encoding = 
				      "UTF8" ),
			    xpath)
	}
	return(bus_data)
}
