#!/usr/bin/env bash
set -x
set -ueo pipefail
# https://linuxconfig.org/how-to-test-microphone-with-audio-linux-sound-architecture-alsa
# '-c 2' : https://unix.stackexchange.com/questions/192554/issues-with-arecord-command-channels-count-non-available

arecord -l
set +x
read -p "which device? enter as '<card number>:<device N>' " device
set -x
# https://explainshell.com/explain?cmd=arecord+-f+S16_LE+-d+10+-r+16000+--device%3D%22hw%3A1%2C0%22+%2Ftmp%2Ftest-mic.wav
# 0: run until it is killed; not feasible for this script
arecord -f S16_LE -d 30 -r 16000 --device="${device}" -c 2 /tmp/test-mic-${device}.wav \
  || fuser -fv /dev/snd/*

aplay /tmp/test-mic-${device}.wav && rm /tmp/test-mic-${device}.wav

# troubleshooting:
# "device or resource busy" : http://www.noah.org/wiki/%22arecord:_..._audio_open_error:_Device_or_resource_busy%22
