./adpcm_auto_run.sh > log.adpcm
./pcm_auto_run.sh > log.pcm
rm fetch
gcc check.c -g -o fetch
./fetch < log.pcm > flog.pcm
./fetch < log.adpcm > flog.adpcm
