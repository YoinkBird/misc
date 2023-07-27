# https://go.dev/doc/manage-install
#

VERSION=1.20.1.linux
ARCH=amd64
TARNAME=go$(VERSION)-$(ARCH).tar.gz

RELEASE_URL=https://go.dev/dl/$(TARNAME)
install:
	export GOROOT=$$(go env GOROOT)   && \
	export GOROOTBAK="$${GOROOT}.bak" && \
	cd /tmp && sudo curl -O $(RELEASE_URL) && \
	sudo mv $${GOROOT} $${GOROOT}.bak      && \
	sudo tar -C /usr/local -xzf $(TARNAME) && \
	exit 1
	echo $$PATH | tr ':' "\n" | grep "^$${GOROOT}/bin$$" && \
	rm -rf $${GOROOT}.bak
