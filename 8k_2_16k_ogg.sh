#!/bin/sh
rm OGG
rm WAV

Folder_TEST="/home/jim/Downloads/out"
EWAV="_8k.wav"
EOGG="_8k.ogg"
SEWAV="__8k.wav"
SWAV="_16k.wav"
SKOGG="_16k.ogg"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	FILE_NAME=$(basename "$file_test" .wav)
	echo $FILE_NAME
	resample -to 8000 $file_test $FILE_NAME$EWAV
	/home/jim/test/compare_tools/program/speexenc $FILE_NAME$EWAV $FILE_NAME$EOGG
	/home/jim/test/compare_tools/program/speexdec $FILE_NAME$EOGG $FILE_NAME$SEWAV
	resample -to 16000 $FILE_NAME$SEWAV $FILE_NAME$SWAV
	/home/jim/test/compare_tools/program/speexenc $FILE_NAME$SWAV $FILE_NAME$SKOGG
	cp $FILE_NAME$SKOGG song.ogg
	/home/jim/test/compare_tools/program/check_aihome.py
done
mkdir OGG
mkdir WAV
mv *.ogg OGG
mv *.wav WAV

echo "--------------------------------------------------------"


for file_test in ${Folder_TEST}/*; do
	mv $file_test song.ogg
	/home/jim/test/compare_tools/program/check_aihome.py
done
