#!/bin/bash

if [ "$2" == "" ] ; then
	echo "Outputs a list of domains where DKIM records were found."
	echo
	echo "usage: $0 <domain list> <output file>"
	exit
fi

outfile=$2
domainslist=$1
selectorslist=DKIM_Selectors.txt
tempfile=.tmp.dkim-check

echo "Generating list of potential selectors..."
for domain in $(cat $domainslist) ; do
	for selector in $( cat $selectorslist ) ; do
		echo $selector._domainkey.$domain
	done
done >> $tempfile

echo $(wc -l $tempfile) records to scan.
echo Press ENTER to start the scan.
read

echo "Scanning for DKIM records..."
./massdns.bin -t txt --resolvers resolvers.txt -o S -w $outfile -q $tempfile


echo "DONE!"

rm -f $tempfile
