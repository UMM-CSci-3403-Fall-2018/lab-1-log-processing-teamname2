#!/bin/bash

# Store the directory in a variable
DIR=$1

# Take each of the graphs generated from previous scripts and put them into a temporary file
cat $DIR/country_dist.html >> $DIR/failed_login_summary_contents.html
cat $DIR/hours_dist.html >> $DIR/failed_login_summary_contents.html
cat $DIR/username_dist.html >> $DIR/failed_login_summary_contents.html

# Use the script wrap_contents to add a header and a footer to the data created above to produce failed_login_summary.html
bin/wrap_contents.sh $DIR/failed_login_summary_contents.html html_components/summary_plots $DIR/failed_login_summary.html

# Remove temp file failed_login_summary_contents.html
rm $DIR/failed_login_summary_contents.html