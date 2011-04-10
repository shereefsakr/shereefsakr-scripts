"""
youtubedownload is a script to download youtube videos
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

