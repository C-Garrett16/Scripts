link_config() {
  local name=$1
  local source="$HOME/Projects/dotfiles/config/$name"
  local target="$HOME/.config/$name"

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "[!] Backing up existing $target → $target.backup.$(date +%s)"
    mv "$target" "$target.backup.$(date +%s)"
  fi

  echo "[*] Linking $target → $source"
  ln -sf "$source" "$target"
}

link_config "alacritty"
link_config "qtile"
link_config "rofi"

