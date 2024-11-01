#!/usr/bin/env bash

# Script to run xsct
if [ $(date '+%H') -ge 20 ] || [ $(date '+%H') -lt 6 ]; then
    xsct 2500 0.8;
else
    xsct 0 0.8;
fi
