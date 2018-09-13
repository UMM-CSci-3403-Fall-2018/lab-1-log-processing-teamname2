#!/bin/bash

# Contents for the output file which contains important data
CONTENTS=$1

# Header and footer for the output file that adds the name and .html extensions
HEADER=$2_header.html
FOOTER=$2_footer.html

# The resulting output file
RESULT=$3

# Concatenate the header, contents, and footer to create a reuslting output file
cat $HEADER $CONTENTS $FOOTER > $RESULT
