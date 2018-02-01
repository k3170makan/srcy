#!/bin/bash
# srcY - quick 'n dirty recursive grep search for files all match a list of regexes
# Usage: srcy.sh file_extension [regex string 1] [regex string 2]
# Output: list of files that all match the regexes
# GNU pub license
# naming: srcy - means ('sausy'/rancy/sassy) AND (SRC/source code OR SRCy/source code - esque) AND (src Y/ src "fork"/split/union of two seperate searches, combination of code paths)
if [ $# -lt 3 ] 
then
 echo "Usage :./$0 [file extension] [regex/string 1] [regex/string 2]"
 echo "Example: ./$0 java poopy buttcheeks"
 echo "[*] PooypButtCheeks.java"
 echo "[*] PoOpYButtCHEEKSImpl_dev.sh"
 echo "[*] ButtCheeksWrapper.sh"
 echo "[*] ..."
 exit 1
fi
EXTENSION=$1
DOMAIN1=$2
DOMAIN2=$3
echo "[-] searching for $EXTENSION files mentioning '$DOMAIN1' and '$DOMAIN2' ..."$
grep * --include=*.${EXTENSION} -Rnie ${DOMAIN1} | awk -F\: '{ print $1 }' > DOMAIN1.tmp
for file in `grep * --include=*.${EXTENSION} -Rnie ${DOMAIN2} | awk -F\: '{ print $1}'`
do
	string=`grep -Fx "$file" DOMAIN1.tmp`;[ "$string" ] && echo "[*] $file"; 
done | uniq
echo "[-]"

