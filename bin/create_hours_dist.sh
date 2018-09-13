#!/bin/bash

# Create a directory variable for the first argument
DIR=$1

# Find all of the files named "failed_login_data" and get the hour from them. Sort them, count them, then format the counted items for the graph creation and output to hours_content.html
find $DIR -name "*failed_login_data*" -exec awk '{print $3}' {} + | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $DIR/hours_content.html

# Use previous script to attach a header and footer to our formated data generated above
bin/wrap_contents.sh $1/hours_content.html html_components/hours_dist $DIR/hours_dist.html

# Remove temporary file
rm $DIR/hours_content.html
