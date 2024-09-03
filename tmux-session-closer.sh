#!/bin/bash

# Check if tmux is active
if ! tmux ls &>/dev/null; then
    echo "Tmux is not running."
    exit 1
fi

# Get the name of the current tmux session
current_session=$(tmux display-message -p '#S')

# List all tmux sessions and exclude the current one
other_sessions=$(tmux list-sessions -F '#S' | grep -v "^$current_session$")

if [[ -z $other_sessions ]]; then
    # No other sessions, so just close the current session
    tmux kill-session -t "$current_session"
else
    # Switch to the first available other session
    other_session=$(echo "$other_sessions" | head -n 1)
    tmux switch-client -t "$other_session"

    # Close the original session
    tmux kill-session -t "$current_session"
fi

