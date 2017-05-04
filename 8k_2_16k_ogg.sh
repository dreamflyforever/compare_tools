#!/bin/sh
Folder_TEST="/home/jim/Downloads/out"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	resample -to 8000 $file_test test.wav
	/home/jim/test/compare_tools/program/speexenc test.wav test.ogg
	 ffmpeg -i test.ogg -ar 16000 song.ogg
	/home/jim/test/compare_tools/program/check_aihome.py
	rm test.wav
	rm song.ogg
	rm test.ogg
done
