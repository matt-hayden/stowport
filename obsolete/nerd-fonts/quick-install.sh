#! /usr/bin/env bash
set -e

SETUP_DIR="$PWD"
FONT_DIR="$HOME/.local/share/fonts"

mkdir -p "$FONT_DIR"
cd "$FONT_DIR"
wget -i "$SETUP_DIR"/raw.urls

fc-cache -f "$FONT_DIR"
