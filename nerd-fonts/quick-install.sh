#! /usr/bin/env bash
set -e

FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"
cd "$FONT_DIR"
wget -i - << EOF
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FantasqueSansMono/Bold/complete/Fantasque%20Sans%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Inconsolata/complete/Inconsolata%20for%20Powerline%20Nerd%20Font%20Complete.otf
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/Meslo/S/complete/Meslo%20LG%20S%20Regular%20for%20Powerline%20Nerd%20Font%20Complete.otf
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/RobotoMono/complete/Roboto%20Mono%20Medium%20Nerd%20Font%20Complete.ttf
https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20derivative%20Powerline%20Nerd%20Font%20Complete.ttf
EOF

fc-cache -f "$FONT_DIR"
