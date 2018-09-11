#!/bin/bash
find $1 -name "*failed_login_data*" -exec awk '{print $3}' {} + | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $1/hours_content.html

bin/wrap_contents.sh $1/hours_content.html html_components/hours_dist $1/hours_dist.html
