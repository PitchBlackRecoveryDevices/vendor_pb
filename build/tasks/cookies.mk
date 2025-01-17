
OMNI_TARGET_PACKAGE := $(PRODUCT_OUT)/omni-$(ROM_VERSION).zip

.PHONY: cookies
cookies: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(OMNI_TARGET_PACKAGE)
	$(hide) $(shell md5sum) $(OMNI_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(OMNI_TARGET_PACKAGE).md5sum
	@echo -e "Package complete: $(OMNI_TARGET_PACKAGE)" >&2
