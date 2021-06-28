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

TARGET_KERNEL_DIR := device/google/raviole-kernel

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-whitefin.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/whitefin/device-vendor-whitefin.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/whitefin/overlay

include device/google/gs101/device-common.mk
include hardware/google/pixel/vibrator/drv2624/device.mk
include device/google/raviole/audio/whitefin/audio-tables.mk

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.whitefin.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.whitefin.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.whitefin.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.whitefin.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.whitefin.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
    device/google/raviole/thermal_info_config_whitefin.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Camera
PRODUCT_COPY_FILES += \
    device/google/raviole/media_profiles_whitefin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.a2dp_offload.supported=false

PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# NFC
PRODUCT_COPY_FILES += \
	device/google/gs101/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += device/google/raviole/powerstats/whitefin

# Trusty liboemcrypto.so
PRODUCT_SOONG_NAMESPACES += vendor/google_devices/raviole/prebuilts
