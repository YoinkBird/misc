#!/bin/env bash
# PURPOSE: reload audio devices; sometimes there's an accident I reckon
# src: https://superuser.com/a/869229
# more reading: https://askubuntu.com/a/427036
pacmd unload-module module-udev-detect && pacmd load-module module-udev-detect
