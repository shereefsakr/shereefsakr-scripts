<<DOC
GrepPartOfFile is a script to grab a part of file starting between a start and end string.
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

#<<Parameterized #Enabled
FILE_NAME=$1
GREP_START_STRING=$2
GREP_END_STRING=$3
#Parameterized

GREP_START=$(grep -in "$echo $GREP_START_STRING" $FILE_NAME | awk -F: '{printf "%s", $1 "\n"}' | head -n 1)
GREP_END=$(grep -in "$echo $GREP_END_STRING" $FILE_NAME | awk -F: '{printf "%s", $1 "\n"}' | head -n 1)
awk $echo "NR>=$GREP_START && NR<=$GREP_END" $FILE_NAME
