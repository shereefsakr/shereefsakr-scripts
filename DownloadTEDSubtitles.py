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


