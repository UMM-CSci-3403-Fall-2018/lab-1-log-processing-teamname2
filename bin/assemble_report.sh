#!/bin/bash

# Take each of the graphs generated from previous scripts and put them into a temporary file
cat $1/country_dist.html >> $1/failed_login_summary_contents.html
cat $1/hours_dist.html >> $1/failed_login_summary_contents.html
cat $1/username_dist.html >> $1/failed_login_summary_contents.html

# Use the script wrap_contents to add a header and a footer to the data created above to produce failed_login_summary.html
bin/wrap_contents.sh $1/failed_login_summary_contents.html html_components/summary_plots $1/failed_login_summary.html

# Remove temp file failed_login_summary_contents.html
rm $1/failed_login_summary_contents.html