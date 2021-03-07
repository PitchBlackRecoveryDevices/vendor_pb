EXPORT_TO_SOONG := \
    TW_THEME \
    TW_CUSTOM_THEME \
    TW_INCLUDE_CRYPTO \
    DEVICE_RESOLUTION \
    TARGET_SCREEN_WIDTH \
    TARGET_SCREEN_HEIGHT \
    TW_DELAY_TOUCH_INIT_MS \
    TW_EVENT_LOGGING \
    TW_USE_KEY_CODE_TOUCH_SYNC \
    TW_OZIP_DECRYPT_KEY \
    TW_NO_SCREEN_BLANK \
    TW_NO_SCREEN_TIMEOUT \
    TW_OEM_BUILD \
    TW_X_OFFSET \
    TW_Y_OFFSET \
    TW_W_OFFSET \
    TW_H_OFFSET \
    TW_ROUND_SCREEN \
    TWRES_PATH \
    TWRP_CUSTOM_KEYBOARD \
    TW_EXTRA_LANGUAGES \
    TARGET_RECOVERY_ROOT_OUT \
    TARGET_RECOVERY_PIXEL_FORMAT \
    AB_OTA_UPDATER


SOONG_CONFIG_NAMESPACES += makeVarsPlugin
SOONG_CONFIG_makeVarsPlugin :=
#SOONG_CONFIG_makeVarsPlugin += TW_THEME
#SOONG_CONFIG_makeVarsPlugin_TW_THEME := $(TW_THEME)
define addVar
  SOONG_CONFIG_makeVarsPlugin += $(1)
  SOONG_CONFIG_makeVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef
$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))
