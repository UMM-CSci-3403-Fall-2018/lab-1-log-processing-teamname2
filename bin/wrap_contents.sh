#!/bin/bash

# Add the contents of a specified header to the desired output file, argument 3, where the name of the specific header is argument 2
cat $2_header.html >> $3

# Add the data to the desired output file, where the data is argument 1
cat $1 >> $3

# Add the contents of a specified footer to the desired output file, argument 3, where the name of the specific footer is argument 2
cat $2_footer.html >> $3
