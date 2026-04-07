# Fish-native mise environment and activation.

set -gx MISE_DATA_DIR "$HOME/.local/share/mise"
set -gx MISE_CONFIG_DIR "$HOME/.config/mise"

if command -q mise
    mise activate fish | source
end
