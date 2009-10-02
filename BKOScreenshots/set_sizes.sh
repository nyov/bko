#!/bin/bash

IFS="
"

for x in $( ls *thumb* )
do
	echo "${x}"
	width=$( file ${x} | awk '{ print $4; }' )
	height=$( file ${x} | awk '{ print $6; }' )
	printf "\theight: ${height} | width: ${width}\n"
	line=$( grep "${x}" ../index.html )
	echo "line: ${line}"
	line_esc=$( echo "${line}"  | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/"/\\"/g' )
	line_new=$( echo "${line}"  | sed -e "s/width=\"[0-9]*\"/width=\"$width\"/" -e "s/height=\"[0-9]*\"/height=\"$height\"/" -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/"/\\"/g' )
	echo "new line: $line_new"

	sed -i "s/${line_esc}/${line_new}/" ../index.html
done
