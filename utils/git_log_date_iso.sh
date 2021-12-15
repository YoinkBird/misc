#!/usr/bin/env bash
# PURPOSE: simple reminder of the log commands for an ISO date; meant more as a reference than a script
set -u

function fn_git_log_date_iso(){
  args="$@"
  # src: https://stackoverflow.com/a/26961614
  git log --date=iso-strict "${args[@]}"
}

fn_git_log_date_iso "${@}"
