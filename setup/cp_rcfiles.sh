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
rcdir_relpath="rcfiles"
rcdir=$(realpath ${repodir}/${rcdir_relpath})
bindir_relpath="utils/bin"
bindir="$(readlink -f "${repodir}/${bindir_relpath}")"

################################################################################
# Configure RCFILES
################################################################################
# default to 'find' unless 'gfind' found (on MacOS)
find_util="$(which gfind > /dev/null 2>&1 && echo "gfind" || echo "find")"
filelist="$(${find_util} ${rcdir} -printf "%P\n")"
# add color to diff if present
diffopts="$(diff --help | grep '\--color\b' > /dev/null 2>&1 && echo "--color=always" || echo "")"
echo "# INFO: configure ${rcdir_relpath}"
echo "# PROCESSING: ${filelist[@]}"
# need to cd in order to examine file types
cd "${rcdir}"
IFS=$'\n'
for file in ${filelist[@]}; do
  echo "#---------"
  # note that 'file' can also be a dir; maybe worth refactoring the name in future
  echo $file
  # if file doesn't exist it could be a broken symlink, so check that it's not actually a symlink
  if [ ! -e ~/${file} ] && [ ! -L ~/${file} ] || [ ${overwrite} -eq 1 ] ; then
    test -z $dbecho && >&2 echo "# CREATING" || >&2 echo "# PREVIEW"
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
    >&2 $dbecho ln "${lnopt}" ${rcdir}/${file} ~/"${file}"
    test -z $dbecho || continue
  else
    >&2 echo "# CHECKING"
    if [[ "${file}" =~ ^"Library" ]]; then
      # exception: skip config dirs of which only a small subset of files are managed by this repo
      >&2 echo "# ... skipping dirs within ~/Library"
      continue
    fi
    set -x
    diff ${diffopts} ${rcdir}/${file} ~/${file} || >&2 echo "# WARN: did not update ~/${file}"
    set +x
  fi
  # quick check; note that 'test -e' also verifies whether a symlink is broken, hence the diagnostic 'ls -ld' in the ERROR msg
  (test -e ~/${file} && ls -ltd ~/${file}) || >&2 echo "# ERROR: did not configure ~/${file}, examine: $(ls -ld ~/${file})"
done

################################################################################
# Configure ~/bin/
################################################################################
echo "# INFO: configure ${bindir_relpath}"
if [[ ! -L "${HOME}/bin" ]]; then
  >&2 $dbecho ln -sv "${bindir}" "${HOME}/bin"
fi
ls -ltd "${HOME}/bin"

echo "################################################################################"
echo "# DONE"
echo "################################################################################"
exit 0
