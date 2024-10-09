#!/usr/bin/env bash
set -euo pipefail
for path in "${@}"; do 
  date -Is -d @"$(stat -c '%Y' "${path}")";
done
