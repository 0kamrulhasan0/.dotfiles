#!/bin/bash

dir_base="/media/kamrul-hasan/epic_shelter/Screen_Worthy/"
download_all_from_page () {
  pattern="(srt|rv|mp4|mkv|wmv|m4v|mov|avi|flv|webm|flac|mka|m4a|aac|ogg)$"
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=.*//')
  file_name=$(echo $link | rev | cut -d '/' -f 2 | rev)
  file_name=$(echo $file_name | sed 's/%.\{2\}/_/g')
  dir=$dir_base$file_name
  hxwls $link | grep -E $pattern | xargs -I % wget -c % -P $dir
}



##For seasons in one go:
#for i in {01..10}; do
#  #link=""
#  #echo $link
#  download_all_from_page $link
#done
