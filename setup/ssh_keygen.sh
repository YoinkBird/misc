#!/usr/bin/env bash
purpose="${1:-"test"}"; shift;
type="${1:-"ed25519"}"; shift;
comment="${1:-"key for ${purpose}"}"; shift;
comment="${1:-"${purpose}"}"; shift;
set -ue
filename="id_${type}_${purpose}"
# hard-code; not sure how to determine dynamically
set -x
test -d ~/.ssh || mkdir ~/.ssh/
ssh-keygen -f ~/.ssh/"${filename}" -t "${type}" -C "${comment}"
set +x
cat <<EOF
# command:
EOF
cat <<'EOF'
# oneliner to add pubkey to authorized keys:
sh -cxu 'cd ~/; authkeys="$(grep "^AuthorizedKeysFile" /etc/ssh/sshd_config | grep -o "\S\+$")"; touch ${authkeys} && chmod 600 ${authkeys}'
EOF

# determine IP: https://curlmyip.org/
