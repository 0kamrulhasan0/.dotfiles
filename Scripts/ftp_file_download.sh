#!/bin/bash

dir_base="/home/kamrul-hasan/Downloads/"
download_all_from_page () {
  local pattern="(srt|sub|idx|rv|mp4|mkv|wmv|m4v|mov|avi|flv|webm|flac|mka|m4a|aac|ogg|pdf)$"
  local link=$(echo $1 | sed 's/index.php?dir=//')
  local link=$(echo $link | sed 's/&file=.*//')
  local link=$(echo "$link" | sed "s/'/\\\\'/g")
  local file_name=$(echo $link | rev | cut -d '/' -f 2 | rev)
  local file_name=$(echo $file_name | sed 's/%.\{2\}/_/g')
  local dir=$dir_base$file_name
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -I % wget -c % -P $dir
  hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 2 -I % wget -c % -P $dir
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 8 -I % aria2c -c -x 8 -d $dir %
}

download_single_file () {
  local link=$(echo $1 | sed 's/index.php?dir=//')
  local link=$(echo $link | sed 's/&file=//')
  wget -c $link -P $dir_base$2
}

download_aria() {
  local filename="$1.mp4"
  #local fullpath="$1.mp4"
  echo $filename 
  aria2c  --continue=true -x 5 -s 5 -d $dir_base -o "$filename" $2 
}

#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""
#download_single_file ""




#For seasons in one go:
#for i in {01..30}; do
#  link=""$i""
#  #echo $link
#done
#shutdown now
