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

# default to 'find' unless 'gfind' found (on MacOS)
find_util="$(which gfind > /dev/null 2>&1 && echo "gfind" || echo "find")"
filelist="$(${find_util} ${rcdir} -printf "%P\n")"
# add color to diff if present
diffopts="$(diff --help | grep '\--color\b' > /dev/null 2>&1 && echo "--color=always" || echo "")"
echo "# PROCESSING:
${filelist[@]}"
# need to cd in order to examine file types
cd "${rcdir}"
for file in ${filelist[@]}; do
  echo "#---------"
  # note that 'file' can also be a dir; maybe worth refactoring the name in future
  echo $file
  if [ ! -e ~/${file} ] || [ ${overwrite} -eq 1 ] ; then
    # if source is actually a directory, explicitely create instead of symlinking
    #+ thoughts: for .config, could be useful to link the entire dir back into git-tracked repo
    #+ OTOH, if the .config already exists when this runs, would need to move it into this repo before symlinking it, which could get messy
    if [[ -d ${file} ]]; then
      $dbecho mkdir -p ~/${file}
      continue
    fi
    lnopt="-sv"
    if [ ${overwrite} -eq 1 ] ; then
      lnopt="${lnopt}f"
    fi
    $dbecho ln "${lnopt}" ${rcdir}/${file} ~/${file}
  else
    set -x
    diff ${diffopts} ${rcdir}/${file} ~/${file} || >&2 echo "# WARN: did not update ~/${file}"
    set +x
  fi
  # quick check
  ls -ltd ~/${file} || echo "# ERROR: did not configure ~/${file}"
done
echo "# DONE"
exit 0
