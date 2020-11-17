#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TARGET_KERNEL_VERSION := 4.9

# Inherit from common msm8937-common
-include device/xiaomi/msm8937-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/tiare

# HIDL
ifeq ($(TARGET_KERNEL_VERSION),3.18)
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest-l2.xml
else ifeq ($(TARGET_KERNEL_VERSION),4.9)
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest-l3.xml
endif

# Kernel
TARGET_KERNEL_CONFIG := tiare_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/tiare-$(TARGET_KERNEL_VERSION)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 50331648
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1390411776
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1971322880
BOARD_VENDORIMAGE_PARTITION_SIZE := 333447168
TARGET_COPY_OUT_VENDOR := vendor

BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 8192
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := squashfs
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_SQUASHFS_COMPRESSOR := lz4

BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := squashfs
BOARD_VENDORIMAGE_JOURNAL_SIZE := 0
BOARD_VENDORIMAGE_SQUASHFS_COMPRESSOR := lz4

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/gesture/onoff"

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.recovery.qcom

# Security Patch Level
VENDOR_SECURITY_PATCH := 2020-05-05

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy-treble

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
BOARD_VNDK_VERSION := current
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

# Inherit from the proprietary version
-include vendor/xiaomi/tiare/BoardConfigVendor.mk
