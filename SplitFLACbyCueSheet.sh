#!/bin/bash
echo "split flac by cue sheets"
echo "Cue sheet file path: "
read cuesheet
echo "FLAC file path: "
read srcfile

# split files by the cuesheet
cuebreakpoints "$cuesheet" | shnsplit -o flac "$srcfile"
# import the tags from the cue sheet to the generated files
cuetag "$cuesheet" split-track*.flac

for file in *.flac ; do
	# Get file index from file name
	index=${file##split-track}
	index=${index%.flac}

	# Get Song title from tags
	title=$(metaflac --show-tag=TITLE "$file")
	title=${title##TITLE}
	title=${title##=}

	# Change file name
	newfilename="$index - $title".flac
	echo "Added : $newfilename"
	mv $file "$newfilename"
done

