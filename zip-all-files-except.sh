#!/bin/bash

## last slash MUST be included
DIRECTORY="/home/shereef/Desktop/testfolder/"
REQUIRED_FILE_SIZE=40000

## Loop on files NOT matching *.log and gzip each one with timestamp
for FILENAME in $(ls -A -1 $DIRECTORY | grep -iv '.log' | grep -iv '.gz')
do
	echo $FILENAME

	NEW_FILENAME="$FILENAME-$(date +'%F_%T_%N')"

	echo $NEW_FILENAME

	FILE_SIZE=$(stat -c%s "$DIRECTORY$FILENAME")

	echo "Size of $FILENAME = $FILE_SIZE bytes."

	if [ "$FILE_SIZE" -ge "$REQUIRED_FILE_SIZE" ]
	  then
		echo "$FILENAME : File size exceeded, file will be compressed and original file will be empty"
		mv "$DIRECTORY$FILENAME" "$DIRECTORY$NEW_FILENAME"
		gzip "$DIRECTORY$NEW_FILENAME"
	fi
done
