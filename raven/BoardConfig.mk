#
# Copyright (C) 2020 The Android Open-Source Project
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
#

# Enable load module in parallel
BOARD_BOOTCONFIG += androidboot.load_modules_parallel=true

# The modules which need to be loaded in sequential
BOARD_KERNEL_CMDLINE += exynos_mfc.load_sequential=1
BOARD_KERNEL_CMDLINE += exynos_drm.load_sequential=1
BOARD_KERNEL_CMDLINE += pcie-exynos-core.load_sequential=1
BOARD_KERNEL_CMDLINE += g2d.load_sequential=1

RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_RAVEN_RADIO_DIR)
ifneq (,$(filter AP1%,$(RELEASE_PLATFORM_VERSION)))
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/24Q1
else ifneq (,$(filter AP2% AP3%,$(RELEASE_PLATFORM_VERSION)))
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/24Q2
else
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/trunk
endif

ifdef AUTOMOTIVE_PRODUCT_PATH
  #RBC# include_top device/google/auto_tcu
  #RBC# include_top device/google/pixel_tcu
  #RBC# include_top device/google_car
  include device/$(AUTOMOTIVE_PRODUCT_PATH)/BoardConfig.mk
else
  TARGET_SCREEN_DENSITY := 560
endif

TARGET_BOARD_INFO_FILE := device/google/raviole/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := raven
USES_DEVICE_GOOGLE_RAVIOLE := true
BOARD_KERNEL_CMDLINE += disable_dma32=on

include device/google/gs101/BoardConfig-common.mk
include device/google/gs101-sepolicy/raven-sepolicy.mk
include device/google/gs101/wifi/BoardConfig-wifi.mk
-include vendor/google_devices/gs101/prebuilts/BoardConfigVendor.mk
-include vendor/google_devices/raven/proprietary/BoardConfigVendor.mk
