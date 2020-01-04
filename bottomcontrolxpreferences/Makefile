ARCHS = arm64 arm64e
TARGET = iPhone:clang:latest:11.0
CFLAGS = -fobjc-arc
LDFLAGS = -F$(THEOS)/frameworks
GO_EASY_ON_ME = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = BottomControlXPreferences
BottomControlXPreferences_FILES = BottomControlXPreferences.mm $(shell find $(THEOS)/include/SettingsKit -name '*.m')
BottomControlXPreferences_INSTALL_PATH = /Library/PreferenceBundles
BottomControlXPreferences_CFLAGS = -fobjc-arc
BottomControlXPreferences_FRAMEWORKS = UIKit MessageUI Social QuartzCore CoreGraphics
#BottomControlXPreferences_PRIVATE_FRAMEWORKS = Preferences
BottomControlXPreferences_LDFLAGS += ./Preferences.tbd

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.png $(THEOS_STAGING_DIR)/Library/PreferenceBundles/BottomControlXPreferences.bundle/$(ECHO_END)
	#$(ECHO_NOTHING)cp $(THEOS)/include/SettingsKit/Resources/*.JPG $(THEOS_STAGING_DIR)/Library/PreferenceBundles/BottomControlXPreferences.bundle/$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BottomControlXPreferences.plist$(ECHO_END)
