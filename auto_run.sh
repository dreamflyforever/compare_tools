#!/bin/sh  
Folder_TEST="/home/jim/Downloads/dao_hang"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	/home/jim/test/adpcm/bin/adpcm -e -i $file_test -o test.adpcm
	/home/jim/test/adpcm/bin/adpcm -d -i test.adpcm -o test.pcm
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos test.pcm
done

#!/bin/sh  
Folder_TEST="/home/jim/Downloads/xia_yi_shou"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	#44k covenr to 16k
	resample -to 16000 $file_test test.wav
	/home/jim/test/adpcm/bin/adpcm -e -i test.wav -o test.adpcm
	/home/jim/test/adpcm/bin/adpcm -d -i test.adpcm -o test.pcm
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos test.pcm
done
