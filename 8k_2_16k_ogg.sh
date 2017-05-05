#!/bin/sh
Folder_TEST="/home/jim/Downloads/out"
EWAV="_8k.wav"
EOGG="_8k.ogg"
SKOGG="_16k.ogg"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	FILE_NAME=$(basename "$file_test" .wav)
	echo $FILE_NAME
	resample -to 8000 $file_test $FILE_NAME$EWAV
	/home/jim/test/compare_tools/program/speexenc $FILE_NAME$EWAV $FILE_NAME$EOGG
	ffmpeg -i $FILE_NAME$EOGG -ar 16000 $FILE_NAME$SKOGG
	#/home/jim/test/compare_tools/program/check_aihome.py
done
mkdir OGG
mkdir WAV
mv *.ogg OGG
mv *.wav WAV
