#!/bin/bash
# Simple monitoring script for CPU, Memory, and Disk

echo "===== System Monitoring Report ====="
echo "Date: $(date)"
echo
echo "CPU Load:"
uptime
echo
echo "Memory Usage:"
free -h
echo
echo "Disk Usage:"
df -h
echo "===================================="
