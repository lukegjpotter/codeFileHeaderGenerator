#/bin/bash
#--------------------------------------
#
#		fileHeaderGenerator.sh
#
#		Author: Luke Potter
#		GitHub: lukegjpotter
#
#		Date: 03/Nov/2012
#
#--------------------------------------
#		Version: 1.0
#--------------------------------------
#
#		Description:
#			A script to generate the file headers.
#
#--------------------------------------

# Exit constants
SUCCESS=0
WRONG_ARGS=1

# Input sanitation check
if [ $# != 4 ]
then
	echo '    [ERROR] Incorrect Usage.'
	echo './fileHeaderGenerator.sh file.sh John Doe johndoe'
	echo ''
	echo 'Pass in the file you wish to create, your first name,'
	echo 'your last name and your GitHub user name.'
	echo ''
	
	exit $WRONG_ARGS
fi

# Month number to string function
function changeMonthNumberToString ()
{
	MONTHS[11]='Nov'
	#=( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec )
	
	# Return value
	echo ${MONTHS[$1]}
}

# User CLI Inputs
newfilename=$1
authorFirstName=$2
authorLastName=$3
githubUsername=$4

# Date determination
day=`date +%d`
month=`date +%m`
year=`date +%y`

# Main part of the script
echo "    [Start]   Starting File Header Generation"

echo "    [Info]    Creating new file"
touch $newfilename

techHeader='#/bin/bash'
seperator='#--------------------------------------'
spacer='#'
monthStr="$(changeMonthNumberToString $month)"

# Echo out the header
echo "    [Info]    Appending header"
echo $techHeader >> $newfilename
echo $seperator >> $newfilename
echo $spacer >> $newfilename
echo "$spacer		$newfilename" >> $newfilename
echo $spacer >> $newfilename
echo "$spacer		Author: $authorFirstName $authorLastName" >> $newfilename
echo "$spacer		GitHub: $githubUsername" >> $newfilename
echo $spacer >> $newfilename
echo "$spacer		Date: $day/$monthStr/$year" >> $newfilename
echo $spacer >> $newfilename
echo $seperator >> $newfilename
echo '#		Version: 1.0' >> $newfilename
echo $seperator >> $newfilename
echo $spacer >> $newfilename
echo '#		Description:' >> $newfilename
echo '#			<Enter Desc>' >> $newfilename
echo $spacer >> $newfilename
echo $seperator >> $newfilename

echo "    [Finish]  File Header Generation complete"
# Successful exit
exit $SUCCESS
