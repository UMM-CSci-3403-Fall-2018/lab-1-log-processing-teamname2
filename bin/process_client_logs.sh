#!/bin/bash

# Go to the directory specified
cd $1

# Extract all the relivant lines in our two cases
grep -wr "Failed password for" --exclude=failed_login_data.txt | awk '$9 != "invalid" {print $1, $2, substr($3, 1, 2), $9, $11}' | cat >> failed_login_data.txt
grep -wr "Failed password for" --exclude=failed_login_data.txt | awk '$9 == "invalid" {print $1, $2, substr($3, 1, 2), $11, $13}' | cat >> failed_login_data.txt

# Clean up 'secure-*' text
awk -F: '{print $2}' failed_login_data.txt



