#!/bin/bash
# Installe les paquets et relie les configs de ce repo dans ~/.config.
# Un dossier existant est renommé en .bak avant d'être remplacé par le lien.
set -e

REPO="$(cd "$(dirname "$0")" && pwd)"

sudo dnf install -y gcc clang make gdb valgrind neovim kitty fish fzf zoxide \
  ripgrep fd-find bat tree fastfetch chafa ImageMagick pipx eza

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mv "$dst" "$dst.bak"
    echo "ancien $dst sauvegardé en $dst.bak"
  fi
  ln -s "$src" "$dst"
  echo "$dst -> $src"
}

link "$REPO/kitty" "$HOME/.config/kitty"
link "$REPO/fish" "$HOME/.config/fish"
link "$REPO/fastfetch" "$HOME/.config/fastfetch"

# Thème fish : fish_variables n'est pas dans le repo, on le règle ici
# (seulement si aucun thème n'est déjà choisi sur cette machine)
fish -c 'set -q my_theme; or set -U my_theme catppuccin-mocha'

# Police : Fantasque Sans Mono en version Nerd Font
FONT_DIR="$HOME/.local/share/fonts/FantasqueSansMNerdFont"
if [ ! -d "$FONT_DIR" ]; then
  tmp="$(mktemp -d)"
  curl -fsSL -o "$tmp/f.tar.xz" \
    https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FantasqueSansMono.tar.xz
  mkdir -p "$FONT_DIR"
  tar -xJf "$tmp/f.tar.xz" -C "$FONT_DIR" --wildcards '*.ttf'
  rm -rf "$tmp"
  fc-cache -f
fi

echo
echo "Reste à faire à la main :"
echo "  chsh -s /usr/bin/fish"
