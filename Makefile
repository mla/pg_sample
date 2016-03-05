NAME=pg_sample
VERSION=$(shell grep VERSION pg_sample | head -1 | egrep -o "[.0-9]+" | sed 's/\./-/g')

INSTALL_FILES=pg_sample

PKG_DIR=dist
PKG_NAME=$(NAME)-$(VERSION)
PKG=$(PKG_DIR)/$(PKG_NAME).tar.gz
SIG=$(PKG_DIR)/$(PKG_NAME).asc

PREFIX?=/usr/local/bin

pkg:
	mkdir -p $(PKG_DIR)

$(PKG): pkg
	git archive --output=$(PKG) --prefix=$(PKG_NAME)/ HEAD

dist: $(PKG)

$(SIG): $(PKG)
	gpg --sign --detach-sign --armor $(PKG)

sign: $(SIG)

clean:
	rm -f $(PKG) $(SIG)

all: $(PKG) $(SIG)

test:
	prove t/

tag:
	git tag v$(VERSION)
	git push --tags

release: $(PKG) $(SIG) tag

install:
	for file in $(INSTALL_FILES); do cp $$file $(PREFIX)/$$file; done

uninstall:
	for file in $(INSTALL_FILES); do rm -f $(PREFIX)/$$file; done

.PHONY: dist sign clean test tag release install uninstall all
