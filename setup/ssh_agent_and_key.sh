#!/usr/bin/env bash
# NOTE: SOURCE this file
# do not change flags as they will persist in the shell
#set -eo pipefail
eval $(ssh-agent )
ssh-add $(ls ~/.ssh/id_* | grep -v '\.pub$')

# test with:
#+ ssh -T git@<host>
