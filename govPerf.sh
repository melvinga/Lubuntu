#!/bin/bash

GOVERNOR_VALUE=performance
MAX_FREQ_VALUE=$(( 64 * 100000 ))
MIN_FREQ_VALUE=$(( 16 * 100000 ))

FILE=/usr/bin/cpufreq-set
if ! [ -f "$FILE" ]; then
  sudo apt update && sudo apt -y install cpufrequtils
fi

if [ -f "$FILE" ]; then
  for ((i=0;i<$(nproc);++i)); do sudo cpufreq-set -c $i -r -g $GOVERNOR_VALUE; done

  echo "Governor is set to:"
  cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
  echo ""

  for ((i=0;i<$(nproc);++i)); do sudo cpufreq-set -c $i --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE; done

  echo "Min freq is set to:"
  cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
  echo ""

  echo "Max freq is set to:"
  cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
  echo ""

  echo "Press Ctrl+C to exit"
  sleep 5
  watch -n1 "cat /proc/cpuinfo | grep \"^[c]pu MHz\""
  echo ""
fi
