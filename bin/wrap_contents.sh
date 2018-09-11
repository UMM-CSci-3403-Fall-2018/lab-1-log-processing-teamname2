#!/bin/bash

CONTENTS=$1
HEADER=$2_header.html
FOOTER=$2_footer.html
RESULT=$3

cat $HEADER $CONTENTS $FOOTER > $RESULT
