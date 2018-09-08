#!/bin/bash

# Go to the directory specified
cd $1

# This is all one line, but adjusted for easier viewing
# The first command, grep, will look for all of the lines in each secure file that is relivant to us
# The second command, awk, checks to see if the user is invalid or not, and record the results accordingly
# The third command, awk, will remove the secure-* before the text
# The fourth command, cat, will print the outcome to a file
grep -wr "Failed password for" --exclude=failed_login_data.txt | 
awk '{if($9 == "invalid"){print $1, $2, substr($3, 1, 2), $11, $13}else{print $1, $2, substr($3, 1, 2), $9, $11}}' | 
awk -F: '{print $2}' | 
cat >> failed_login_data.txt



