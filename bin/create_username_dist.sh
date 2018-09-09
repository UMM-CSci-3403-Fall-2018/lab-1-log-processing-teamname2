#!/bin/bash

# Add the header (Will change to use wrap_contents.sh in the future
cat html_components/username_dist_header.html >> $1/username_dist.html

# This is all one line, here is a breakdown
# find looks into all the subdirectories of the given directory and looks for "failed_login_data.txt"
# awk is passed the results of find and prints the fourth column, which is the user names
# sort is passed the results of awk and sorts the results alphabeticlly
# uniq then counts the occurances of the names
# awk then constructs a string that will be used to add data to our chart
# cat finally prints all of it into username_dist.html
find $1 -name "failed_login_data.txt" -exec 
awk '{print $4}' {} + | 
sort | 
uniq -c | 
awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | 
cat >> $1/username_dist.html

# Add the footer
cat html_components/username_dist_footer.html >> $1/username_dist.html