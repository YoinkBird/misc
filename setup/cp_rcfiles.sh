#!/usr/bin/env bash
set -ue
#set -x
scriptdir=$(dirname $0)
repodir=$(dirname ${scriptdir})
rcdir=${repodir}/rcfiles

for file in $(ls -A $rcdir); do
  echo "#---------"
  echo $file
  if [[ ! -e ~/${file} ]] ; then
    echo cp -v ${rcdir}/${file} ~/${file}
  else
    diff ${rcdir}/${file} ~/${file}
  fi
done
