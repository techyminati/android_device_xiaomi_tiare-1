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
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

ifeq ($(TARGET_KERNEL_VERSION),3.18)
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest-l2.xml
else ifeq ($(TARGET_KERNEL_VERSION),4.9)
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest-l3.xml
endif

# Kernel
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/7824900.sdhci
TARGET_KERNEL_CONFIG := tiare_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/tiare-$(TARGET_KERNEL_VERSION)

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 50331648
BOARD_CACHEIMAGE_PARTITION_SIZE := 157286400
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1971322880

BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 1390411776
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 333447168
BOARD_SUPER_PARTITION_SIZE := 1723858944
BOARD_SUPER_PARTITION_GROUPS := group_default
BOARD_GROUP_DEFAULT_SIZE := 1719664640
BOARD_GROUP_DEFAULT_PARTITION_LIST := system
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 10485760
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 20971520
BOARD_EXT4_SHARE_DUP_BLOCKS := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/gesture/onoff"

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/fstab.recovery.qcom

# Security Patch Level
VENDOR_SECURITY_PATCH := 2020-05-05

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Inherit from the proprietary version
-include vendor/xiaomi/tiare/BoardConfigVendor.mk
