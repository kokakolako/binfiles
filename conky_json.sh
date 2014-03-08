#!/usr/bin/env zsh

echo '{"version":1}'
echo '['
echo '[],'

exec conky -c "$HOME/.config/conky/conky_json.conf"

