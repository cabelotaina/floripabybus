for file in linha*.html; do
cat $file | tidy -f errs.txt | sed 's/&nbsp;/ /g' | html2text | egrep 'p=|h1=|td=' | sed '/Selecione um idioma:/d;/Copyright/d;/Parceiros/d;/Apoio/d' | html2text | sed 's/Â//g;s/[ãáàâ]/a/g;s/[ÃÁÀ]/A/g;s/[éê]/e/g;s/[ÉÊ]/E/g;s/[íì]/i/g;s/[ÍÌ]/I/g;s/[óõô]/o/g;s/[ÓÕÔ]/O/g;s/[ú]/u/g;s/[Ú]/U/g;s/ç/c/g;s/Ç/C/g' | html2text > $file.txt
linea=$(cat $file.txt | egrep '[0-9]{2,4} - [A-Za-z ]*' | head -n 1 | sed 's/\*\*\*\*\*\* //' | sed 's/ \*\*\*\*\*\*//' | sed 's/\//-/'); mv $file.txt "$linea.txt"
done
