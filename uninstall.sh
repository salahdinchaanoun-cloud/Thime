#!/data/data/com.termux/files/usr/bin/bash
echo "سيزيل هذا السكربت ملفات TERMUX-X وإضافته إلى .bashrc."
read -rp "متابعة؟ (y/N): " ans
[[ "$ans" =~ ^[Yy]$ ]] || exit 0
sed -i '/# TERMUX-X LAUNCHER/,+1d' "$HOME/.bashrc" 2>/dev/null
sed -i '/# >>> TERMUX-X PROMPT >>>/,/# <<< TERMUX-X PROMPT <<</d' "$HOME/.bashrc" 2>/dev/null
sed -i '/# >>> TERMUX-X WELCOME >>>/,/# <<< TERMUX-X WELCOME <<</d' "$HOME/.bashrc" 2>/dev/null
rm -f "$HOME/.local/bin/termux-x"
rm -rf "$HOME/.termux-x"
echo "تمت إزالة TERMUX-X. لم يتم حذف ملفاتك الشخصية."
