# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.


# The package path prefix, if you want to install to another root, set DESTDIR to that root
PREFIX = /usr
# The command path excluding prefix
BIN = /bin
# The resource path excluding prefix
DATA = /share
# The command path including prefix
BINDIR = $(PREFIX)$(BIN)
# The resource path including prefix
DATADIR = $(PREFIX)$(DATA)
# The generic documentation path including prefix
DOCDIR = $(DATADIR)/doc
# The info manual documentation path including prefix
INFODIR = $(DATADIR)/info
# The man page documentation path including prefix
MANDIR = $(DATADIR)/man
# The man page section 1 path including prefix
MAN1DIR = $(MANDIR)/man1
# The license base path including prefix
LICENSEDIR = $(DATADIR)/licenses

# The name of the command as it should be installed
COMMAND = redshift-adjust
# The name of the package as it should be installed
PKGNAME = redshift-adjust


# Build rules

.PHONY: default
default: base

.PHONY: all
all: base

.PHONY: base
base: command

.PHONY: command
command:


# Install rules

.PHONY: install
install: install-base install-man

.PHONY: install-all
install-all: install-base install-doc

# Install base rules

.PHONY: install-base
install-base: install-command install-copyright

.PHONY: install-command
install-command:
	install -dm755 -- "$(DESTDIR)$(BINDIR)"
	install -m755 src/redshift-adjust -- "$(DESTDIR)$(BINDIR)/$(COMMAND)"

.PHONY: install-copyright
install-copyright: install-copying install-license

.PHONY: install-copying
install-copying:
	install -dm755 -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"
	install -m644 COPYING -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"

.PHONY: install-license
install-license:
	install -dm755 -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"
	install -m644 LICENSE -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"

# Install documentation rules

.PHONY: install-doc
install-doc: install-man

.PHONY: install-man
install-man:
	install -dm755 -- "$(DESTDIR)$(MAN1DIR)"
	install -m644 doc/man/redshift-adjust.1 -- "$(DESTDIR)$(MAN1DIR)/$(COMMAND).1"


# Uninstall rules

.PHONY: uninstall
uninstall:
	-rm -- "$(DESTDIR)$(BINDIR)/$(COMMAND)"
	-rm -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)/COPYING"
	-rm -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)/LICENSE"
	-rm -- "$(DESTDIR)$(MAN1DIR)/$(COMMAND).1"
	-rmdir -- "$(DESTDIR)$(LICENSEDIR)/$(PKGNAME)"


# Clean rules

.PHONY: clean
clean:

