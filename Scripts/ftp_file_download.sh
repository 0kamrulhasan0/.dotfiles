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

download_single_file () {
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=//')
  wget -c $link -P $dir_base
}

download_all_from_page "http://172.22.22.103/ftpdata/cartoon/index.php?dir=Tom%20and%20Jerry%20Cartoons%20Complete%20Collection%20%281940-2007%29%20%5BDVDRip%5D/"
#For seasons in one go:
#for i in {01..10}; do
#  #link=""
#  link="http://172.22.22.103/ftpdata/tv_shows_eng/index.php?dir=VEEP%20/Veep%20Season%2"$i"/"
#  #echo $link
#  download_all_from_page $link
#done




#shutdown now
