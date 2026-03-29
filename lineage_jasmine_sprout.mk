#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 The Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device configuration
$(call inherit-product, device/xiaomi/jasmine_sprout/device.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Build Description — original stock fingerprint for Play Integrity
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="jasmine-user 8.1.0 OPM1.171019.011 V9.6.17.0.ODIMIFE release-keys" \
    BuildFingerprint=xiaomi/jasmine/jasmine_sprout:8.1.0/OPM1.171019.011/V9.6.17.0.ODIMIFE:user/release-keys \
    DeviceProduct=jasmine_sprout

# Device identifier
PRODUCT_NAME := lineage_jasmine_sprout
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_PLATFORM := SDM660
PRODUCT_DEVICE := jasmine_sprout
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi A2
TARGET_VENDOR_PRODUCT_NAME := jasmine

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
