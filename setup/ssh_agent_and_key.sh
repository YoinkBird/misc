#!/usr/bin/env bash
# NOTE: SOURCE this file
# do not change flags as they will persist in the shell
#set -eo pipefail
eval $(ssh-agent )
for key in $(ls ~/.ssh/id_* | grep -v '\.pub$'); do
  # enable ^C to skip adding keys if desired
  trap continue INT
  # macos https://superuser.com/a/1133038
  # TODO: ascertain why adding one key prints out "Identidy added" for mulitple other keys.
  # + it appears that running the following command even without passing in a key would print that message,
  # + so it's possible that the command is simply printing out each already configured key
  ssh-add --apple-use-keychain --apple-load-keychain "${key}"
done
trap - INT

# test with:
#+ ssh -T git@<host>
