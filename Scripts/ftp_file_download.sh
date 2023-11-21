#!/bin/bash

dir_base="/media/kamrul-hasan/epic_shelter/UPLOAD/"
download_all_from_page () {
  pattern="(srt|sub|idx|rv|mp4|mkv|wmv|m4v|mov|avi|flv|webm|flac|mka|m4a|aac|ogg|pdf)$"
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=.*//')
  link=$(echo "$link" | sed "s/'/\\\\'/g")
  file_name=$(echo $link | rev | cut -d '/' -f 2 | rev)
  file_name=$(echo $file_name | sed 's/%.\{2\}/_/g')
  dir=$dir_base$file_name
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -I % wget -c % -P $dir
  hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 2 -I % wget -c % -P $dir
  #hxwls $link | grep -E $pattern | sed 's/^/"/; s/$/"/' | xargs -P 8 -I % aria2c -c -x 8 -d $dir %
}

download_single_file () {
  link=$(echo $1 | sed 's/index.php?dir=//')
  link=$(echo $link | sed 's/&file=//')
  wget -c $link -P $dir_base$2
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
download_single_file "http://data102.mazedanetworks.net/s1d4/index.php?dir=Tamil%20Movies/Tiger.Nageswara.Rao.2023.1080p.AMZN.WEB-DL.DDP5.1.H.264-Telly/&file=Tiger.Nageswara.Rao.2023.1080p.AMZN.WEB-DL.DDP5.1.H.264-Telly.mkv"
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
