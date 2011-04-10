"""
DownloadTEDSubtitles is a script to download TED Talk Translations in SRT format
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
"""

import os
import sys
import json
import urllib2

# Format Time from TED Subtitles format to SRT time Format
def formatTime ( time ) :
	milliseconds = 0
	seconds = ((time / 1000) % 60)
	minutes = ((time / 1000) / 60)
	hours = (((time / 1000) / 60) / 60)
	formatedTime = str ( hours ) + ':' + str (minutes) + ':' + str ( seconds ) + ',' + str ( milliseconds )
	return formatedTime

# Convert TED Subtitles to SRT Subtitles
def convertTEDSubtitlesToSRTSubtitles ( jsonString , introDuration ) :
	jsonObject = json.loads( jsonString )

	srtContent = ''
	captionIndex = 1

	for caption in jsonObject['captions'] :
		startTime = str ( formatTime ( introDuration + caption['startTime'] ) )
		endTime = str ( formatTime ( introDuration + caption['startTime'] + caption['duration'] ) )

		srtContent += ( str ( captionIndex ) + os.linesep )
		srtContent += ( startTime + ' --> ' + endTime + os.linesep )
		srtContent += ( caption['content'] + os.linesep )
		srtContent += os.linesep

		captionIndex = captionIndex + 1
	return srtContent

def getTEDSubtitlesByTalkID ( talkId , language ) :
	tedSubtitleUrl = 'http://www.ted.com/talks/subtitles/id/' + str(talkId) + '/lang/' + language
	req = urllib2.Request(tedSubtitleUrl)
	response = urllib2.urlopen(req)
	result = response.read()
	return ( result )

tedTalkUrl = sys.argv[1]
language = sys.argv[2]

req = urllib2.Request(tedTalkUrl)
response = urllib2.urlopen(req)
result = response.read()

## Get Talk ID value
splits = result.split ( ';ti=' )
talkId = splits[1].split ( '&' )[0]
print talkId

## Get Talk Intro Duration value
splits = result.split ( ';introDuration=' )
talkIntroDuration = splits[1].split ( '&' )[0]
talkIntroDuration = int ( talkIntroDuration )
print talkIntroDuration

jsonString = getTEDSubtitlesByTalkID ( talkId , language )

srtContent = convertTEDSubtitlesToSRTSubtitles ( jsonString , talkIntroDuration )

# Generate SRT file name
splits = tedTalkUrl.split ( '/' )
srtFilename = splits[len ( splits )-1].split ('.')[0]

srtFile = open ( './' + srtFilename + '.srt' , 'w' )
srtFile.write ( srtContent.encode ( "utf-8" ) )
srtFile.close ()


