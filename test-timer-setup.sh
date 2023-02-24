#!/bin/bash

mkdir -p "$HOME"/.config/systemd/user
cp test-timer.timer "$HOME"/.config/systemd/user/
cp test-timer.service "$HOME"/.config/systemd/user/
systemctl enable --now --user test-timer.timer # create symlinks and start timer
loginctl list-users
echo "Ensure to `loginctl enable-linger` for the current user"
