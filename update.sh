#!/bin/bash
git fetch --all
git reset --hard origin/master
function EXPERM{
	DIR=$1;
	shift;
	for EXT in "$@"
	do 
	find ./$DIR -type f -path *.$EXT -exec chmod -f +x {} \;
	done	
}
function EXPERMALL{
	DIR=$1;
	shift;
	find ./$DIR -type f -exec chmod -f +x {} \;	
}
EXPERM shbin sh
EXPERM cgi-bin pl pm
EXPERM cgi-bin-old pl pm
EXPERM pybin py
EXPERM pymodules py
chmod -f +x ./update.sh
./pybin/pyzip_files/make_pyz.sh