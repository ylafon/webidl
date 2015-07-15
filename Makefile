all : index.html l1-respec.html

index.html : index.xml WebIDL.xsl
	xsltproc --nodtdattr --param now `date +%Y%m%d` WebIDL.xsl index.xml >index.html

l1-respec.html: index-filtered.xml WebIDL-l1.xsl
	xsltproc --nodtdattr --param now `date +%Y%m%d` WebIDL-l1.xsl index-filtered.xml >l1-respec.html

index-filtered.xml: index.xml
	sed 's/\[\[/[[\\/g' index.xml | sed "s,\(<a\ href=[\"\']#ref-[^\'\"]*[\'\"]>\)\([^<]*\)\(</a>\),\1[\2]\3,g" | sed 's,\[\[ECMA-262,[[!ECMA-262,g' | sed 's,\[\[IEEE-754,[[!IEEE-754,g' | sed 's,\[\[PERLRE,[[!PERLRE,g' | sed 's,\[\[RFC,[[!RFC,g' | sed 's,\[\[TYPEDARRAYS,[[!TYPEDARRAYS,g' | sed 's,\[\[UNICODE,[[!UNICODE,g' > index-filtered.xml

v1.html : v1.xml WebIDL.xsl
	xsltproc --nodtdattr --param now `date +%Y%m%d` WebIDL.xsl v1.xml >v1.html

index.ids : index.xml
	./xref.pl -d index.xml http://heycam.github.io/webidl/ > index.ids

java.html : java.xml WebIDL.xsl index.ids
	xsltproc --nodtdattr --param now `date +%Y%m%d` WebIDL.xsl java.xml | ./xref.pl -t - index.ids > java.html

clean :
	rm -f index.html  java.html index.ids index-filtered.xml l1-respec.html

.PHONY : all clean
