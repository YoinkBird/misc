#!/usr/bin/env bash
set -ue
#set -x
dbecho="echo"
if [[ $# > 0 ]]; then
  if [[ $1 =~ force ]]; then
    dbecho=""
  fi
fi

scriptdir=$(dirname $0)
repodir=$(dirname ${scriptdir})
rcdir=${repodir}/rcfiles

for file in $(ls -A $rcdir); do
  echo "#---------"
  echo $file
  if [[ ! -e ~/${file} ]] ; then
    $dbecho cp -v ${rcdir}/${file} ~/${file}
  else
    diff ${rcdir}/${file} ~/${file}
  fi
done
