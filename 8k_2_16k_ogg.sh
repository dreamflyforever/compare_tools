#!/bin/sh
Folder_TEST="/home/jim/Downloads/out"
WAV=".wav"
OGG=".ogg"
SKOGG="_16k.ogg"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	FILE_NAME=$(basename "$file_test" .wav)
	echo $FILE_NAME
	resample -to 8000 $file_test $FILE_NAME$WAV
	/home/jim/test/compare_tools/program/speexenc $FILE_NAME$WAV $FILE_NAME$OGG
	ffmpeg -i $FILE_NAME$OGG -ar 16000 $FILE_NAME$SKOGG
	#/home/jim/test/compare_tools/program/check_aihome.py
done
