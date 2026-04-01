# Fish-native pyenv initialization migrated from `env.sh`.

if command -q pyenv
    if not contains -- "$PYENV_ROOT/bin" $PATH
        set -gx PATH "$PYENV_ROOT/bin" $PATH
    end

    pyenv init - fish | source
end
