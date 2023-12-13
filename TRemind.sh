#!/bin/bash

Check if espeak is installed; if not, try to install it
if ! command -v espeak &> /dev/null; then
    echo "espeak is not found. Let's do it..."
    if command -v apt-get &> /dev/null; then
        sudo apt-get install espeak
    elif command -v yum &> /dev/null; then
        sudo yum install espeak
    elif command -v dnf &> /dev/null; then
        sudo dnf install espeak
    elif command -v zypper &> /dev/null; then
        sudo zypper install espeak
    else
        echo "Unsupported package manager. Please install 'espeak' manually."
        exit 1
    fi
fi

while true; do
    # Get the current time in HH:MM format
    current_time=$(date +"%H:%M")
    current_hour=$(date +"%H")

    # Check if it's the beginning of a new hour (00 minutes)
    if [ "${current_time:3}" == "00" ]; then
        # Announce the time using espeak
        espeak "The_timeis,$current_hour"
    fi

    # Sleep for a minute before checking again
    sleep 60
done
