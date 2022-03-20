# Release name
PRODUCT_RELEASE_NAME := Samsung Galaxy J5

# Inherit from j5 2015-2016 vendor
ifeq ($(PRODUCT_DEVICE),j5xnlte)
    $(call inherit-product, vendor/samsung/j5x-common/j5x-common-vendor.mk)
else ifeq ($(PRODUCT_DEVICE),j5nlte)
    $(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)
else ifeq ($(PRODUCT_DEVICE),j5lte)
    $(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)
else ifeq ($(PRODUCT_DEVICE),j5ltechn)
    $(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)
else ifeq ($(PRODUCT_DEVICE),j53gxx)
    $(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)
endif

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Include full languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable flatten APEX
TARGET_FLATTEN_APEX := true

# Enable Incremental on the device
PRODUCT_PROPERTY_OVERRIDES += ro.incremental.enable=yes

# Include Bluetooth config
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/configs/bluetooth

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
PRODUCT_GMS_CLIENTID_BASE := android-samsung
