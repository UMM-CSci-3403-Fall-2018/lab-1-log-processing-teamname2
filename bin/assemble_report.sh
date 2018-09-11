#!/bin/bash

cat $1/country_dist.html >> $1/failed_login_summary_contents.html
cat $1/hours_dist.html >> $1/failed_login_summary_contents.html
cat $1/username_dist.html >> $1/failed_login_summary_contents.html

bin/wrap_contents.sh $1/failed_login_summary_contents.html html_components/summary_plots $1/failed_login_summary.html
