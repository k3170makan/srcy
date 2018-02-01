#!/bin/bash
# srcY - quick 'n dirty recursive grep search for files all match a list of regexes
# Usage: srcy.sh file_extension [regex string 1] [regex string 2]
# Output: list of files that all match the regexes
# GNU pub license
# naming: srcy - means ('sausy'/rancy/sassy) AND (SRC/source code OR SRCy/source code - esque) AND (src Y/ src "fork"/split/union of two seperate searches, combination of code paths)
EXTENSION=$1
DOMAIN1=$2
DOMAIN2=$3

grep * --include=*.${EXTENSION} -Rnie ${DOMAIN1} | awk -F\: '{ print $1 }' > DOMAIN1.tmp
for file in `grep * --include=*.${EXTENSION} -Rnie ${DOMAIN2} | awk -F\: '{ print $1}'`
do
	string=`grep -Fx "$file" DOMAIN1.tmp`;[ "$string" ] && echo "[*] $file"; 
done | uniq

