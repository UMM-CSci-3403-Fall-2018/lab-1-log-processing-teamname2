#!/bin/bash

# Create a directory variable for the first argument
DIR=$1

# Find all files named "failed_login_data" and get the ip from them, sort them, and dump to a tempory file since join requires two files
find $DIR -name "*failed_login_data*" -exec awk '{print $5}' {} + | sort | cat >> $DIR/sorted_ips.txt

# Joins the country map to the sorted ips, gets the country code, sorts them, counts them, and puts them into a nice format before finally printing out the html
join --nocheck-order etc/country_IP_map.txt $1/sorted_ips.txt | awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $DIR/country_content.html

bin/wrap_contents.sh $DIR/country_content.html html_components/country_dist $DIR/country_dist.html

# Clean up tempory file "sorted_ips.txt"
rm $DIR/sorted_ips.txt
rm $DIR/country_content.html
