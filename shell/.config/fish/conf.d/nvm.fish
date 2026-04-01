# Fish-compatible NVM wrapper migrated from `env.sh`.

if test -s "$NVM_DIR/nvm.sh"
    if not functions -q nvm
        function nvm --description "Run nvm through bash"
            set -l nvm_args (string join " " -- (string escape -- $argv))
            bash -lc "source \"$NVM_DIR/nvm.sh\" >/dev/null 2>&1; nvm $nvm_args"
        end
    end
end
