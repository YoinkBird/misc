#!/usr/bin/env bash
set -x
# https://linuxconfig.org/how-to-test-microphone-with-audio-linux-sound-architecture-alsa
# '-c 2' : https://unix.stackexchange.com/questions/192554/issues-with-arecord-command-channels-count-non-available

arecord -l
arecord -f S16_LE -d 10 -r 16000 --device="hw:2,0" -c 2 /tmp/test-mic.wav \
  || fuser -fv /dev/snd/*

aplay /tmp/test-mic.wav && rm /tmp/test-mic.wav

# troubleshooting:
# "device or resource busy" : http://www.noah.org/wiki/%22arecord:_..._audio_open_error:_Device_or_resource_busy%22
