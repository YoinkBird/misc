#!/usr/bin/env bash
scriptdir="$(dirname $BASH_SOURCE[0])"
set -eu
set -x
projectname=$1
${scriptdir}/git_init_base.sh
curl -L -o .gitignore https://raw.githubusercontent.com/github/gitignore/main/Go.gitignore
git add .gitignore
git commit -m $'golang gitignore from github\n\nhttps://raw.githubusercontent.com/github/gitignore/main/Go.gitignore'
git log -n 1 --name-only
go mod init ${projectname}
git add go.mod
echo "WARNING - very simple initial file"
touch ${projectname}.go && git add ${projectname}.go && git commit -m "quick init: initial go file"
git log -n 1 --name-only
git status
