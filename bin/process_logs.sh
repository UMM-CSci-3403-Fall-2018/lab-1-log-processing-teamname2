#!/bin/bash
 
TMPDIR=`mktemp --directory`
 
for var in "$@"
do
	FILENAME=`echo $var | awk -F. '{print $1}' | awk -F\/ '{print $2}' | awk -F_ '{print $1}'`
	mkdir $TMPDIR/$FILENAME
	tar -zxf $var --directory $TMPDIR/$FILENAME

	# Generate client logs
	bin/process_client_logs.sh $TMPDIR/$FILENAME
done

# Collect all the usernames from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_username_dist.sh $TMPDIR html_components/username_dist $TMPDIR/username_dist.html

# Collect all the hours from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_hours_dist.sh $TMPDIR html_components/hours_dist $TMPDIR/hours_dist.html

# Collect all the countries from failed_login_data.txt in the temp directory (including subdirectories)
bin/create_country_dist.sh $TMPDIR html_components/country_dist $TMPDIR/country_dist

# Combine all three graphs into one html summary
bin/assemble_report.sh $TMPDIR

# Move the completed file back up to the project root directory
mv $TMPDIR/failed_login_summary.html ./

# Clean up the tmp directory
rm -rf $TMPDIR
