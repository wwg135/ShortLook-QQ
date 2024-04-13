TARGET := iphone:clang:latest:15.0
THEOS_PACKAGE_SCHEME=rootless
PACKAGE_VERSION = 1.0.1
DEBUG = 1
FINALPACKAGE = 0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ShortLook-QQ
$(BUNDLE_NAME)_CFLAGS = -fobjc-arc
$(BUNDLE_NAME)_FILES = $(wildcard *.m)
$(BUNDLE_NAME)_FRAMEWORKS = UIKit
$(BUNDLE_NAME)_INSTALL_PATH = /Library/Dynastic/ShortLook/Plugins/ContactPhotoProviders

include $(THEOS_MAKE_PATH)/bundle.mk

BUNDLE_PATH = $($(BUNDLE_NAME)_INSTALL_PATH)/$(BUNDLE_NAME).bundle

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)$(BUNDLE_PATH)$(ECHO_END)
	$(ECHO_NOTHING)cp info.plist $(THEOS_STAGING_DIR)$(BUNDLE_PATH)/info.plist$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
