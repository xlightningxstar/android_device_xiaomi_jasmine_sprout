#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sdm660-common
include device/xiaomi/sdm660-common/BoardConfigCommon.mk

# Device Path
DEVICE_PATH := device/xiaomi/jasmine_sprout

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Camera
TARGET_TS_MAKEUP := true
TARGET_USES_QTI_CAMERA_DEVICE := true
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_DEVICE_SPECIFIC_CAMERA := true
$(call project-set-path,qcom-camera,$(DEVICE_PATH)/camera)

# Density
TARGET_SCREEN_DENSITY := 440

# Kernel
TARGET_KERNEL_CONFIG += vendor/xiaomi/jasmine_sprout.config

# Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

# Partitions — Retrofitted dynamic for jasmine (no cust partition)
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 2147483648
BOARD_SUPER_PARTITION_SIZE := $(shell expr \
    $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + \
    $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE))
BOARD_XIAOMI_DYNAMIC_PARTITIONS_SIZE := $(shell expr \
    $(BOARD_SUPER_PARTITION_SIZE) - 4194304)

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

# Inherit the proprietary files
include vendor/xiaomi/jasmine_sprout/BoardConfigVendor.mk
