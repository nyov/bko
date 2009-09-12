#!/bin/bash
set -e

# pick the configuration information
source ../config

# all scripts are in install_help folder
cd ..


remove_temp () {
    rm -f list_bko_tmpl_files list_conf_files tempcopy
}

replace_placeholder_with_data ()
{
    regular_expression=`echo "s/$2/$3/g"`
    echo "Substituting $2 URL by [$regular_expression]..."
    for line in `cat $1` 
    do
#       echo "Processing file $line"
        perl -p -i -e "$regular_expression" $line
    done
}

remove_temp
echo "Finding files to process"
find ./ -name "*.bko.tmpl" 2> /dev/null 1> ./list_bko_tmpl_files || :
cp list_bko_tmpl_files list_conf_files
echo "processing files"
cat list_bko_tmpl_files
perl -p -i -e 's/.bko.tmpl/.conf/g' list_conf_files
paste list_bko_tmpl_files list_conf_files -d'|' > tempcopy

echo "copying files..."
for line in `cat ./tempcopy` 
do
#    echo "line is [$line]"
    cp -f `echo $line | cut -d'|' -f1` `echo $line | cut -d'|' -f2`
done

replace_placeholder_with_data ./list_conf_files "P_ISO_LOCATION_LOCAL" $ISO_LOCATION_LOCAL 
replace_placeholder_with_data ./list_conf_files "P_ISCSI_LOCATION_LOCAL" $ISCSI_LOCATION_LOCAL

remove_temp

echo "Done with configuration of BKO"
