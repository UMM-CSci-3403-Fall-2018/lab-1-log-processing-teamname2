#!/bin/bash
 
TMPDIR=`mktemp --directory`
 
for var in "$@"
do
	FILENAME=`echo $var | awk -F. '{print $1}' | awk -F\/ '{print $2}' | awk -F_ '{print $1}'`
	mkdir $TMPDIR/$FILENAME
	tar -zxf $var --directory $TMPDIR/$FILENAME
	echo "Extracted contents of $FILENAME ..."

	# Generate client logs
	bin/process_client_logs.sh $TMPDIR/$FILENAME
	echo "Generated failed login data ..."
done

# Collect all the usernames from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_username_dist.sh $TMPDIR html_components/username_dist $TMPDIR/username_dist.html
echo "Generated username_dist.html ..."

# Collect all the hours from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_hours_dist.sh $TMPDIR html_components/hours_dist $TMPDIR/hours_dist.html
echo "Generated hours_dist.html ..."

# Collect all the countries from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_country_dist.sh $TMPDIR html_components/country_dist $TMPDIR/country_dist

tree $TMPDIR
 
rm -rf $TMPDIR
