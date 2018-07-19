#!/usr/bin/env bash
set -ue
#set -x
dbecho="echo"
overwrite=0

# usage: just throw everything in first arg, e.g. $0 run-overwrite
if [[ $# > 0 ]]; then
  if [[ $1 =~ run ]]; then
    dbecho=""
  fi
  if [[ $1 =~ overwrite ]]; then
    overwrite=1
  fi
fi

scriptdir=$(dirname $0)
repodir=$(dirname ${scriptdir})
rcdir=$(realpath ${repodir}/rcfiles)

for file in $(ls -A $rcdir); do
  echo "#---------"
  echo $file
  if [ ! -e ~/${file} ] || [ ${overwrite} -eq 1 ] ; then
    # $dbecho cp -v ${rcdir}/${file} ~/${file}
    # technically not necessary, since the above check is for existence or desired overwrite
    #+ If it doesn't exist, then it doesn't matter if linking is forced
    #+ anyway, that's a logic thingy and one more 'if' won't hurt.
    $dbecho ln -sv ${rcdir}/${file} ~/${file}
    if [ ${overwrite} -eq 1 ] ; then
      $dbecho ln -sfv ${rcdir}/${file} ~/${file}
    fi
  else
    diff ${rcdir}/${file} ~/${file}
  fi
  # quick check
  ls -ltd ${rcdir}/${file}
done
