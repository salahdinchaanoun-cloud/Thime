#!/data/data/com.termux/files/usr/bin/bash
set -e
echo "== TERMUX-X Installer =="
if [ ! -d "$PREFIX" ]; then
  echo "هذا المثبت مخصص لتطبيق Termux."
  exit 1
fi
pkg update -y
pkg install -y git coreutils
mkdir -p "$HOME/.local/bin" "$HOME/.termux-x"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp "$SCRIPT_DIR/termux-x" "$HOME/.local/bin/termux-x"
chmod +x "$HOME/.local/bin/termux-x"
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc" ;;
esac
if ! grep -q 'TERMUX-X LAUNCHER' "$HOME/.bashrc" 2>/dev/null; then
cat >> "$HOME/.bashrc" <<'EOF'

# TERMUX-X LAUNCHER
alias termux-x='$HOME/.local/bin/termux-x'
EOF
fi
echo
echo "تم التثبيت. نفّذ:"
echo "source ~/.bashrc"
echo "termux-x"
