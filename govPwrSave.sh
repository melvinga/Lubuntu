#!/bin/bash

# FOR i5-8265U
GOVERNOR_VALUE=powersave
MIN_FREQ_VALUE=400000
MAX_FREQ_VALUE=1600000

sudo cpufreq-set --cpu 0 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 1 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 2 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 3 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 4 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 5 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 6 --governor $GOVERNOR_VALUE 
sudo cpufreq-set --cpu 7 --governor $GOVERNOR_VALUE 

echo "Governor is set to:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
echo ""

sudo cpufreq-set --cpu 0 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 1 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 2 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 3 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 4 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 5 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 6 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE
sudo cpufreq-set --cpu 7 --min $MIN_FREQ_VALUE --max $MAX_FREQ_VALUE

echo "Min freq is set to:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_min_freq
echo ""

echo "Max freq is set to:"
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
echo ""
