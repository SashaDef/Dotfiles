#!/bin/bash

# Get the current Hyprland workspace
current_workspace=$(hyprctl activeworkspace -j | jq -r '.id')

# Get all Alacritty windows in the current workspace
alacritty_windows=$(hyprctl clients -j | jq -r ".[] | select(.class == \"Alacritty\" and .workspace.id == $current_workspace) | .pid")

# Check if any Alacritty windows exist in the current workspace
if [[ -n "$alacritty_windows" ]]; then
    # Get the first Alacritty window's PID
    alacritty_pid=$(echo "$alacritty_windows" | head -n 1)
    
    # Get the current working directory of the Alacritty process
    # This uses the /proc filesystem to find the CWD
    if [[ -d "/proc/$alacritty_pid" ]]; then
        cwd=$(readlink -f "/proc/$alacritty_pid/cwd")
        echo "Alacritty found in workspace $current_workspace. CWD: $cwd"
    else
        echo "Alacritty process $alacritty_pid not found"
        exit 1
    fi
else
    echo "No Alacritty windows found in current workspace"
    exit 1
fi

# Now you can use the $cwd variable in your script
# For example:
# cd "$cwd"
