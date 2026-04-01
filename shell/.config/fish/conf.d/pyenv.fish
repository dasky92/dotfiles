# Fish-native pyenv environment and initialization.

set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

if command -q pyenv
    if not contains -- "$PYENV_ROOT/bin" $PATH
        set -gx PATH "$PYENV_ROOT/bin" $PATH
    end

    pyenv init - fish | source
end
