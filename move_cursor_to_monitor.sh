#!/bin/bash

# Program provided by ChatGPT from OpenAI

# Function to display an error message
display_error_message() {
    zenity --error --text "Monitor $1 not found. Please specify a valid monitor number.

Available $(xrandr --listactivemonitors)"
}


# Function to move cursor to the center of a monitor
move_cursor_to_center() {
    monitor_info=$(xrandr --listactivemonitors)
    monitor_number=$1
    monitor_found=false

    # Extract information for the specified monitor
    while IFS= read -r line; do
        if [[ $line =~ ([0-9]+):\ (.+)\ ([0-9]+)/([0-9]+)x([0-9]+)/([0-9]+)\+([0-9]+)\+([0-9]+)\ (.+) ]]; then
            index="${BASH_REMATCH[1]}"
            if [ "$index" == "$monitor_number" ]; then
                x="${BASH_REMATCH[7]}"
                y="${BASH_REMATCH[8]}"
                width="${BASH_REMATCH[3]}"
                height="${BASH_REMATCH[5]}"

                # Calculate center coordinates of the monitor
                center_x=$((x + width / 2))
                center_y=$((y + height / 2))

                # Move cursor to the center of the monitor
                xdotool mousemove "$center_x" "$center_y"
                monitor_found=true
                break
            fi
        fi
    done <<< "$monitor_info"

    # If monitor not found, display error message
    if ! $monitor_found; then
        display_error_message "$monitor_number"
        exit 1
    fi
}

# Main script
if [ $# -eq 0 ]; then
    echo " "
    echo "Usage: $0 <monitor_number>"
    echo " "
    xrandr --listactivemonitors
    echo " "
    exit 1
fi

monitor_number=$1
move_cursor_to_center "$monitor_number"
