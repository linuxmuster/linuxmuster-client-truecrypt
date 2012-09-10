#!/usr/bin/make
# Zur Erstellung des Debian-Pakets notwendig (make DESTDIR=/root/sophomorix)
# Created by Rüdiger Beck (jeffbeck-at-web.de)
DESTDIR=

CONF=$(DESTDIR)/etc/linuxmuster-client/truecrypt
BIN=$(DESTDIR)/usr/bin
SBIN=$(DESTDIR)/usr/sbin
SHARE=$(DESTDIR)/usr/share/linuxmuster-client-truecrypt
ETC=$(DESTDIR)/etc/sudoers.d

help:
	@echo ' '
	@echo 'Most common options of this Makefile:'
	@echo '-------------------------------------'
	@echo ' '
	@echo '   make help'
	@echo '      show this help'
	@echo ' '
	@echo '   make install'
	@echo '      install all stuff'
	@echo ' '
	@echo '   make deb'
	@echo '      create a debian package'
	@echo ' '


install:
	@echo '   * Installing sudoers stuff'
	@install -d -m0440 -oroot -groot $(ETC)
	@install -oroot -groot --mode=0440 sudo/linuxmuster-client-truecrypt $(ETC)
	@echo '   * Adding Icon'
	@install -d -m0755 -oroot -groot $(SBIN)
	@install -oroot -groot --mode=0440 scripts/linuxmuster-client-truecrypt-installer $(SBIN)


# build a package
deb:
	### deb
	@echo 'Did you do a dch -i ?'
	#@sleep 8
	dpkg-buildpackage -tc -uc -us -sa -rfakeroot
	@echo ''
	@echo 'Do not forget to tag this version in git'
	@echo ''

