# Fish-native global PATH defaults.

if not contains -- "$HOME/.local/bin" $PATH
    set -gx PATH "$HOME/.local/bin" $PATH
end

set -l brew_paths /usr/local/sbin /usr/local/bin
for path_entry in $brew_paths
    if not contains -- $path_entry $PATH
        set -gx PATH $path_entry $PATH
    end
end
