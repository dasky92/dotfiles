# Fish-compatible Node tool environment.

set -gx NVM_DIR "$HOME/.nvm"
set -gx PNPM_HOME "$HOME/Library/pnpm"

if not contains -- "$PNPM_HOME" $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end

if test -s "$NVM_DIR/nvm.sh"
    if not functions -q nvm
        function nvm --description "Run nvm through bash"
            set -l nvm_args (string join " " -- (string escape -- $argv))
            bash -lc "source \"$NVM_DIR/nvm.sh\" >/dev/null 2>&1; nvm $nvm_args"
        end
    end
end
