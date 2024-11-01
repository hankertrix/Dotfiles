#!/usr/bin/env sh

# Script to run xsct
if [ "$(date '+%H')" -ge 19 ] || [ "$(date '+%H')" -lt 7 ]; then
    xsct 2500 0.8;
else
    xsct 0 0.8;
fi
