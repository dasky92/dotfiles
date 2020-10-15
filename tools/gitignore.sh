# This is script for generating .gitignore file with system, language, etc.
# > ./gitignore.sh
# add gi() to ~/.bashrc 
# > gi list
# You can use `gi list` to fetch usable command args.
# > gi linux,python > .gitignore
# Generating .gitignore
# The above commands will take serval seconds because it would connect the internet.

echo "function gi() { curl -sL https://www.gitignore.io/api/\$@ ;}" >> \
~/.bashrc && source ~/.bashrc
