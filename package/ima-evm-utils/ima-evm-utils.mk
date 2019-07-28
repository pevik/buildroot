################################################################################
#
# ima-evm-utils
#
################################################################################

IMA_EVM_UTILS_VERSION = 1.1
IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
IMA_EVM_UTILS_LICENSE = GPL-2.0
IMA_EVM_UTILS_LICENSE_FILES = COPYING
IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl

# configure is missing but gpm seems not compatible with our autoreconf
# mechanism so we have to do it manually instead of using IMA_EVM_UTILS_AUTORECONF = YES
define IMA_EVM_UTILS_RUN_AUTOGEN
	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
IMA_EVM_UTILS_PRE_CONFIGURE_HOOKS += IMA_EVM_UTILS_RUN_AUTOGEN

# build just sources in src subdirectory as root directory requires asciidoc
# and xsltproc for manpage
define IMA_EVM_UTILS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all
endef
define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
endef
define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
endef

$(eval $(autotools-package))
