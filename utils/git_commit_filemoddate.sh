#!/usr/bin/env bash
set -euo pipefail
# sh -c 'for path in "${@}"; do date -Is -d @"$(stat -c '%Y' "${path}")"; done' -- setup/linux/ setup/linux/firefox* | sort -r | head -n 1


# [default] cache/staging or [optional] amend previous commit
commit_from="cache"
# if [[ $# -gt 0 ]]; then
for arg in "${@}"; do
  if [[ "${arg}" == "--amend" ]]; then
    commit_from="HEAD"
    # shift;
  fi
done
# fi

function fn_git_path_stat(){
  # get modification times of files for specific git commit use cases of "amend" or "cache"
  local commit_from="$1"; shift;
  if [[ "${commit_from}" == "HEAD" ]]; then
    for path in $(git show --name-only --format="" HEAD); do
      date -Is -d @"$(stat -c '%Y' "${path}")"
    done
  elif [[ "${commit_from}" == "cache" ]]; then
    for path in $(git diff --cached --name-only --format="" HEAD); do
      date -Is -d @"$(stat -c '%Y' "${path}")"
    done
  fi
}
# get latest file modification time
last_date="$(fn_git_path_stat ${commit_from} | sort -r | head -n 1)"

set -x
git commit "${@}" --date="${last_date}"

