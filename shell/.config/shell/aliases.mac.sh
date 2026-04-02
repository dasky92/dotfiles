# ============================================
# macOS Specific
# ============================================

# Hex dump fallback
command -v hd > /dev/null || alias hd="hexdump -C"

# md5/sha1 fallbacks for macOS
command -v md5sum > /dev/null || alias md5sum="md5"
command -v sha1sum > /dev/null || alias sha1sum="shasum"

# Desktop icons (for presentations)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"