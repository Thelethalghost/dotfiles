#!/bin/sh

config="$HOME/.config/hypr/hyprpaper.conf"
wallpapers="$HOME/Pictures/Wallpapers"
#for picture in "$wallpapers"/*; do
#done
wallpaper="$(find -L "$wallpapers" -maxdepth 1 -type f | shuf -n 1)"
echo "ipc" = on > "$config"
echo "preload = $wallpaper" >> "$config"
while true; do
  sleep 60
  hyprctl hyprpaper wallpaper "eDP-1,$wallpaper"
  break
done

