file_generator <- function (index){
	if(index %in% 1:9){
		paste("linha_det.php_0",index,".html", sep = "")
	}else if(index %in% 10:99){
		paste("linha_det.php_00",index,".html", sep = "")
	}else{
		paste("linha_det.php_00",index,".html", sep = "")
	}
}

scrap_fields <- function(xpath){ 
	bus_data = NULL;
	for (i in 1:209 ) { 
		bus_data[i] = xpathSApply(
					  htmlParse( file_generator(i)
						    ,encoding = "UTF8" 
						    ),
					  xpath
					  )
	}
	return(bus_data)
}
