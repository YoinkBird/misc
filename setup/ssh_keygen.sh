#!/usr/bin/env bash
filename="${1:-"test"}"; shift;
type="${1:-"rsa"}"; shift;
comment="${1:-"key for testing purposes"}"; shift;
set -ue
cat <<EOF
# command:
ssh-keygen -f ${filename} -t ${type} -C "${comment}"
EOF
cat <<'EOF'
# oneliner to add pubkey to authorized keys:
sh -cxu 'cd ~/; authkeys="$(grep "^AuthorizedKeysFile" /etc/ssh/sshd_config | grep -o "\S\+$")"; touch ${authkeys} && chmod 600 ${authkeys}'
EOF

# determine IP: https://curlmyip.org/
