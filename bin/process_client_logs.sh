#!/bin/bash

# Go to the directory specified
cd $1

# Create a file for the skimmed logs
grep -wr "(^[A-Z]\w+\s\s\d+\s\d+)" --exclude=failed_login_data.txt > failed_login_data.txt
