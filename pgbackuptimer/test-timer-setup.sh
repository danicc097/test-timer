#!/bin/bash

mkdir -p "$HOME"/.config/systemd/user
cp test-timer.timer "$HOME"/.config/systemd/user/
cp test-timer.service "$HOME"/.config/systemd/user/
systemctl enable --now --user test-timer.timer # create symlinks and start timer

# check it exists for the current user:
systemctl --user list-timers --all # only show timers for the user, remove --user to see everything EXCEPT user ones
# we probably need to log into the user directly, not through su - <user> (bus error)
