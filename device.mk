#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 The Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit the sdm660-common definitions
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)

# Device Path
DEVICE_PATH := device/xiaomi/jasmine_sprout

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# jasmine launched on Android 8.1 (API 27)
PRODUCT_SHIPPING_API_LEVEL := 27

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
    $(DEVICE_PATH)/configs/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

# Camera — jasmine has 12MP+20MP dual rear, 20MP front
PRODUCT_PACKAGES += \
    camera.sdm660

# ConsumerIR — jasmine HAS IR blaster
BOARD_HAVE_IR := true

# Device properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Fingerprints — jasmine uses Goodix/FPC
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service.xiaomi_sdm660

# FM Radio — jasmine does NOT have FM radio
# BOARD_HAVE_QCOM_FM is intentionally NOT set here

# Overlays
PRODUCT_PACKAGES += \
    JasmineFrameworksOverlay \
    JasmineSettingsOverlay \
    JasmineSystemUIOverlay \
    JasmineWifiOverlay \
    NoCutoutOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/properties/product.prop

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/keylayout/sdm660-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm660-snd-card_Button_Jack.kl

# Ramdisk
PRODUCT_PACKAGES += \
    init.device.rc

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Vibrator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# WiFi
PRODUCT_PACKAGES += \
    JasmineWifiOverlay

# WiFi Firmware Symlinks
PRODUCT_PACKAGES += \
    firmware_wlan_mac.bin_symlink

# Vendor files
$(call inherit-product, vendor/xiaomi/jasmine_sprout/jasmine_sprout-vendor.mk)
