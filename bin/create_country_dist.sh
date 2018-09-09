#!/bin/bash


# Add the header (Will change to use wrap_contents.sh in the future
cat html_components/country_dist_header.html >> $1/country_dist.html

# Find all files named "failed_login_data" and get the ip from them, sort them, and dump to a tempory file since join requires two files
find $1 -name "*failed_login_data*" -exec awk '{print $5}' {} + | sort | cat >> $1/sorted_ips.txt

# Joins the country map to the sorted ips, gets the country code, sorts them, counts them, and puts them into a nice format before finally printing out the html
join --nocheck-order etc/country_IP_map.txt $1/sorted_ips.txt | awk '{print $2}' | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $1/country_dist.html

# Clean up tempory file "sorted_ips.txt"
rm $1/sorted_ips.txt

# Add the footer
cat html_components/country_dist_footer.html >> $1/country_dist.html
