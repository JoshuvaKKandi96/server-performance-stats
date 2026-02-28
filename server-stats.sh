#!/bin/bash

echo "============================================"
echo "        SERVER PERFORMANCE STATS"
echo "============================================"

# CPU Usage
echo ""
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"% used"}'

# Memory Usage
echo ""
echo "Memory Usage:"
free -m | awk 'NR==2{
    printf "Used: %sMB\nFree: %sMB\nUsage: %.2f%%\n",
    $3,$4,$3*100/$2 }'

# Disk Usage
echo ""
echo "Disk Usage:"
df -h --total | grep 'total' | awk '{
    printf "Used: %s\nFree: %s\nUsage: %s\n",
    $3,$4,$5 }'

# Top 5 Processes by CPU
echo ""
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory
echo ""
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

# Stretch Goals
echo ""
echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME

echo ""
echo "System Uptime:"
uptime -p

echo ""
echo "Load Average:"
uptime | awk -F'load average:' '{ print $2 }'

echo ""
echo "Logged In Users:"
who

echo ""
echo "============================================"
