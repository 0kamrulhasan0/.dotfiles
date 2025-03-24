#!/bin/bash

dir_base="/home/kamrul/Downloads"
download_all_from_page () {
  local pattern="(srt|sub|idx|rv|mp4|mkv|wmv|m4v|mov|avi|flv|webm|flac|mka|m4a|aac|ogg|pdf)$"
  local link=$(echo $1 | sed 's/index.php?dir=//')
  local link=$(echo $link | sed 's/&file=.*//')
  local link=$(echo "$link" | sed "s/'/\\\\'/g")
  local file_name=$(echo $link | rev | cut -d '/' -f 2 | rev)
  local file_name=$(echo $file_name | sed 's/%.\{2\}/_/g')
  local dir=$dir_base$file_name
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -I % wget -c % -P $dir
  hxwls $link  
  hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 2 -I % wget -c % -P $dir
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 8 -I % aria2c -c -x 8 -d $dir %
}

download_single_file () {
  local link=$(echo $1 | sed 's/index.php?dir=//')
  local link=$(echo $link | sed 's/&file=//')
  wget -c $link -P $dir_base$2
}

download_aria() {
  local filename="$1"
  #local fullpath="$1.mp4"
  echo $filename 
  aria2c  --continue=true -x 5 -s 5 -d $dir_base -o "$filename" $2 
}

#https://pandamovies.org/actor/kali-sudhra
#download_aria "Nina Hartly's Guide to Female Ejaculation.mp4" "https://yeo145l.video-delivery.net/u5kjyee2ppflsdgge5mfsy2einrjq3ttgbnwc6q3c7lqonjzrakw4ngjkhoq/gdmoty429c~Dbjx1b150H?token=lcs8ovdw4w61nwjiezyh09bd&expiry=1706955785693" 


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
# Devs
#download_all_from_page ""
# Under the Bridge (2024)
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
#download_all_from_page ""
download_all_from_page "http://172.16.50.12/DHAKA-FLIX-12/TV-WEB-Series/TV%20Series%20%E2%99%A5%20%20A%20%20%E2%80%94%20%20L/House%20of%20Ninjas%20%28TV%20Series%202024%E2%80%93%20%29%20720p%20%5BMulti%20Audio%5D/Season%201/"
download_all_from_page "http://172.16.50.9/DHAKA-FLIX-9/Anime%20%26%20Cartoon%20TV%20Series/Anime-TV%20Series%20%E2%99%A5%20%20G%20%20%E2%80%94%20%20M/Invincible%20%28TV%20Cartoon%202021%E2%80%93%20%29%201080p%20%5BDual%20Audio%5D/Season%202/"
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
