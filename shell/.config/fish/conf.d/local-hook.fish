if status is-interactive
    # Fish-native local override hook mirroring the old `.zshrc.local` pattern.
    if test -f "$HOME/.config/fish/config.local.fish"
        source "$HOME/.config/fish/config.local.fish"
    end
end
