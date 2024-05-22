#!/bin/bash

if [ "$1" == "" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ] ; then
	echo "Outputs all domains for which a DKIM record was found."
	echo
	echo "usage: $0 <dkim-check raw output file>"
	exit
fi

cat $1 | grep -E 'CNAME|(TXT.*([dD][Kk][Ii][Mm]|[kp]=))' | cut -d ' ' -f 1 | sed -E 's/^.*_domainkey\.|\.$//g' | sort -fu
