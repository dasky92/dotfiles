#! /bin/bash
# 暂时不使用

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 \e[0m\n"
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1 \e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\n\e[0;35m  >>> $1 \e[0m\n"
}

print_warning() {
    # Print output in yellow
    printf "\n\e[0;33m  [!] $1 \e[0m\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1 \e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_help() {
    echo 'Install dotfiles in your home directory'
    echo
    echo '  -u          to uninstall'
    echo '  -h/--help   for help'
    exit 0
}

if [ "$1" == '--help' -o "$1" == '-h' ]; then
    print_help
fi

is_uninstall="test '$1' == '-u'"

if [ "$1" != '' -a "$1" != '-u' ]; then
    echo "Params don't make sense, look at --help"
    exit 1
fi

# cd to current directory
# For Linux
if [ "$(uname)" == "Darwin" ]; then
  dotfiles_directory=$(dirname $(greadlink -f $0))
else
  dotfiles_directory=$(dirname $(readlink -f $0))
fi

cd $dotfiles_directory

dotfiles_config_path="${dotfiles_directory}/config"


# search only dotfiles without the own used files
#files_to_home=$(ls -A | grep -v '^\.gitmodules\|^\.gitignore\|^tools\|^scripts\|^LICENSE\|^README.md\|^install\.sh\|^\.git$')
files_to_home=$(ls -A ${dotfiles_config_path})

for file in $files_to_home; do
    if ${is_uninstall}; then
        if [ -L ~/$file ]; then
            rm ~/$file && print_success "Removed '$file'"
        fi
    elif [ -e ~/$file ]; then
        print_warning "File '$file' already exists, cannot create a link to it"
    else
        ln -s $dotfiles_config_path/$file ~/$file
        print_success "Added '$file'"
    fi
done

# setting for .bashrc
bashrc_include='. ~/.bashrc.local'
bashrc=~/.bashrc
if $is_uninstall; then
    if test "$bashrc_include" == "$(tail -1 $bashrc)"; then
        # delete the last line
        sed -i '$ d' $bashrc
    fi
else
    if test "$bashrc_include" == "$(tail -1 $bashrc)"; then echo; else
        echo $bashrc_include >> $bashrc
    fi

    # if test "$(type -p git)" == '' ; then
    #     echo 'Git not available, cannot install sub repositories properly.'
    # else
    #     git submodule update --init --recursive
    # fi
fi

# collect, clear, --force
