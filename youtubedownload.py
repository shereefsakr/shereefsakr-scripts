import os
import sys
import re
import urllib2

## Main
videoUrl = sys.argv[1]

## Get the video HTML page
req = urllib2.Request( videoUrl )
response = urllib2.urlopen(req)
data = response.read ()

## Get T value
splits = data.split ( '&t=' )
youtube_tvalue = splits[1].split ( '&' )[0]
print youtube_tvalue

## Get video_id value
splits = data.split ( '&video_id=' )
youtube_videoid = splits[1].split ( '&' )[0]
print youtube_videoid

## Get the video file
videoFileUrl = 'http://www.youtube.com/get_video?video_id=' + youtube_videoid + '&t=' + youtube_tvalue
print videoFileUrl
req = urllib2.Request( videoFileUrl )
response = urllib2.urlopen(req)

data = response.read ()

fileName = youtube_videoid + '.flv'

savedFile = open( './' + fileName ,'w')
savedFile.write ( data ) ;
savedFile.close () ;

print 'Done.'

