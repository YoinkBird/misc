#!/usr/bin/env bash
set -ue
set -x
scriptdir=$(dirname $0)
repodir=$(dirname ${scriptdir})

if [[ ! -e ~/.vimrc ]] ; then
  cp -v ${repodir}/vim/vimrc ~/.vimrc
else
  diff ${repodir}/vim/vimrc ~/.vimrc
fi
