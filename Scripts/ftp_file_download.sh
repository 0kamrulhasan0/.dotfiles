#!/bin/bash

dir_base="/media/kamrul-hasan/epic_shelter/UPLOAD/"
download_all_from_page () {
  pattern="(srt|sub|idx|rv|mp4|mkv|wmv|m4v|mov|avi|flv|webm|flac|mka|m4a|aac|ogg)$"
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=.*//')
  file_name=$(echo $link | rev | cut -d '/' -f 2 | rev)
  file_name=$(echo $file_name | sed 's/%.\{2\}/_/g')
  dir=$dir_base$file_name
  hxwls $link | grep -E $pattern | xargs -I % wget -c % -P $dir
  #hxwls $link | grep -E $pattern | xargs -0 wget 
}

download_single_file () {
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=//')
  wget -c $link -P $dir_base$2
}

#For seasons in one go:
for i in {01..30}; do
  link=""$i""
  #echo $link
  download_single_file $link "Folder Name"
done
#shutdown now

