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
else
  echo "# INFO: preview mode"
fi

scriptdir=$(dirname $0)
repodir=$(dirname ${scriptdir})
rcdir=$(realpath ${repodir}/rcfiles)

echo "# PROCESSING:
$(ls -1 -A $rcdir)"
for file in $(ls -A $rcdir); do
  echo "#---------"
  # really hacky; for directories this really doesn't work well at all
  echo $file
  if [ ! -e ~/${file} ] || [ ${overwrite} -eq 1 ] ; then
    lnopt="-sv"
    if [ ${overwrite} -eq 1 ] ; then
      lnopt="${lnopt}f"
    fi
    $dbecho ln "${lnopt}" ${rcdir}/${file} ~/${file}
  else
    set -x
    diff --color ${rcdir}/${file} ~/${file} || echo "# WARN: did not update ~/${file}"
    set +x
  fi
  # quick check
  ls -ltd ~/${file} || echo "# ERROR: did not configure ~/${file}"
done
