#!/usr/bin/env bash
# https://go.dev/doc/manage-install
#
set -x
set -eu
set -o errtrace
trap restore ERR
VERSION="1.20.1"
PLAT="linux"
ARCH="amd64"
TARNAME="go${VERSION}.${PLAT}-${ARCH}.tar.gz"
verify="go${VERSION} ${PLAT}/${ARCH}"

RELEASE_URL=https://go.dev/dl/${TARNAME}

export GOROOT="$(go env GOROOT)"
if [[ -z "${GOROOT}" ]]; then
  GOROOT="/usr/local/go"
fi
export GOROOTBAK="${GOROOT}.bak"

function checkver(){
  go version | grep "${verify}"
  test "$(go version)" == "go version ${verify}"
}

function verify(){
  echo $PATH | tr ':' "\n" | grep "^${GOROOT}/bin$"
  checkver
}

function restore(){
  sudo mv ${GOROOTBAK} ${GOROOT}
  verify
}

# prepare
cd /tmp && sudo curl -L -O ${RELEASE_URL}
sudo mv ${GOROOT} ${GOROOTBAK}

# install
sudo tar -C /usr/local -xzf ${TARNAME}

# verify
verify

# finalise
sudo rm -rf ${GOROOTBAK}
