#!/usr/bin/env bash
set -u


function fn_git_branch_rm_merged(){
  rc=0
  echo "go ham on the following branches?"
  set -x
  git branch --merged | grep -v -e '\bmaster\b' -e '^*' || rc=1
  if [[ "${rc}" -ne 0 ]]; then
    echo "no branches found" && return 1
  fi
  set +x
  read -p "<type 'eys' to confirm> " __go_ham
  if [[ "${__go_ham:-}" != "eys" ]]; then
    echo "no choice is also a choice. bye!"
    exit
  fi
  unset __go_ham
  set -x
  for branch in $(git branch --merged | grep -v -e '\bmaster\b' -e '^*'); do
    git branch -d ${branch}
  done
  set +x
}


function fn_git_remote_prune(){
  # git prune -n
  local remote="origin" # would actually need to be variable
  remotes=($(git remote))
  echo "go ham on the following remotes?"
  set -x
  for remote in ${remotes[@]}; do
    git remote prune -n "${remote}"
    echo $?
  done
  set +x
  read -p "<type 'eys' to confirm> " __go_ham
  if [[ "${__go_ham:-}" != "eys" ]]; then
    echo "no choice is also a choice. bye!"
    exit
  fi
  unset __go_ham
  set -x
  for remote in ${remotes[@]}; do
    set -x
    git remote prune "${remote}"
    set +x
  done
}




fn_git_branch_rm_merged
fn_git_remote_prune