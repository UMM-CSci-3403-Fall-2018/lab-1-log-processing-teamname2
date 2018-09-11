#!/bin/bash

find $1 -name "*failed_login_data*" -exec awk '{print $4}' {} + | sort | uniq -c | awk '{print "data.addRow([\x27"$2"\x27, "$1"]);"}' | cat >> $1/content.html

bin/wrap_contents.sh $1/content.html html_components/username_dist $1/username_dist.html
