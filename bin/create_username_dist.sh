#!/bin/bash

# Find all of the files named "failed_login_data" and get the username from them. Sort them, count them, then format the counted items for the graph creation and output to usernames_content.html
find $1 -name "*failed_login_data*" -exec awk '{print $4}' {} + | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $1/usernames_content.html

# Use previous script to attach a header and footer to our formated data generated above
bin/wrap_contents.sh $1/usernames_content.html html_components/username_dist $1/username_dist.html

# Remove temporary file
rm $1/usernames_content.html
