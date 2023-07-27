#!/usr/bin/env bash
set -x
git init 
curl -L -o .gitignore https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore
git add .gitignore
git commit -m $'python gitignore from github\n\nhttps://raw.githubusercontent.com/github/gitignore/main/Python.gitignore'
git log -n 1 --name-only
python3 -m venv $PWD
git add -A && git commit -m "python3 -m venv \$PWD"
git log -n 1 --name-only
# run manually - sourcing bin/activate won't persist outside of this script.
# ensure that end-user is running in venv, instead of mistakenly thinking the script has managed all
# stage the file to make it shows up in the last git status as a visual reminder of the required action
touch requirements.txt && git add requirements.txt
echo "#RUN MANUALLY:"
echo <<EOF
. ./bin/activate
pip freeze > requirements.txt && git add requirements.txt && git commit -m "initial requirements.txt"
EOF
#touch requirements.txt && git add requirements.txt && git commit -m "initial requirements.txt"
git status
