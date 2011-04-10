<<DOC
SplitFLACByCueSheet is a script to split a single flac file into several files using given *.cue sheet.
Copyright (C) 2011  Shereef Sakr

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
DOC


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

