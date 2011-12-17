<<DOC
rename-quran-files is a script to rename quran files to be readable and can be sorted alphabetically. (for usage on smart phones).
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
playlistfilename=$(pwd | sed 's/.*\///i' )

echo $playlistfilename

echo *.mp3 | sed s/mp3\\s/mp3\\n/g > "$playlistfilename.m3u"
