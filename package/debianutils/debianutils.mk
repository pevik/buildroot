################################################################################
#
# debianutils
#
################################################################################

DEBIANUTILS_VERSION = 5.7-0.2
DEBIANUTILS_SOURCE = debianutils-debian-$(DEBIANUTILS_VERSION).tar.bz2
DEBIANUTILS_SITE = https://salsa.debian.org/debian/debianutils/-/archive/debian/$(DEBIANUTILS_VERSION)
DEBIANUTILS_AUTORECONF = YES
DEBIANUTILS_CONF_OPTS = --exec-prefix=/
DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
DEBIANUTILS_LICENSE_FILES = debian/copyright

$(eval $(autotools-package))
