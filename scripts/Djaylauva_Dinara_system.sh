#!/bin/bash
# Student: Dinara Djaylauva | Group: IT2-2313 | ID: 38086

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Djaylauva_Dinara_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Dinara"
echo "Surname: Djaylauva"
echo "Group: IT2-2313"
echo "Student ID: 38086"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/^Mem:/ {print $3 " used of " $2}')"
echo ""

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
