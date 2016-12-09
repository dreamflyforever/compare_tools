#!/bin/sh  
Folder_TEST="/home/jim/Downloads/dao_hang"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm $file_test
done

Folder_TEST="/home/jim/Downloads/xia_yi_shou"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	#44k covenr to 16k
	resample -to 16000 $file_test test.wav
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm test.wav
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/2d_mo_shi"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm $file_test
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/che_tou_xiang_shang"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	#44k covenr to 16k
	resample -to 16000 $file_test test.wav
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm test.wav
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/duo_bi_xian_xing"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm $file_test
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/guan_bi_ping_mu"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	#44k covenr to 16k
	resample -to 16000 $file_test test.wav
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm test.wav
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/guan_bi_sheng_yin"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	#44k covenr to 16k
	resample -to 16000 $file_test test.wav
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm test.wav
done

Folder_TEST="/home/jim/Downloads/data_wkwrd/hai_yao_duo_jiu"
for file_test in ${Folder_TEST}/*; do
	echo $file_test
	/opt/aispeech/linux_asr/aispeech-speex-ogg-c-sample-20151116/fos_pcm $file_test
done
