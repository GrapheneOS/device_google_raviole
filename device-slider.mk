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

TARGET_KERNEL_DIR ?= device/google/raviole-kernel
TARGET_BOARD_KERNEL_HEADERS := device/google/raviole-kernel/kernel-headers

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-slider.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/slider/device-vendor-slider.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/slider/overlay

include device/google/gs101/device-common.mk
include device/google/raviole/audio/slider/audio-tables.mk
include hardware/google/pixel/vibrator/cs40l25/device.mk
include device/google/gs101/bluetooth/bluetooth.mk

# go/lyric-soong-variables
$(call soong_config_set,lyric,camera_hardware,slider)
$(call soong_config_set,lyric,tuning_product,slider)
$(call soong_config_set,google3a_config,target_device,slider)

# WirelessCharger
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += device/google/gs101/device_framework_matrix_product_wireless.xml

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.slider.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.slider.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.slider.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.slider.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.slider.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
    device/google/raviole/thermal_info_config_slider.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Camera
PRODUCT_COPY_FILES += \
    device/google/raviole/media_profiles_slider.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# Bluetooth default BDADDR for EVB only
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.bluetooth.evb_bdaddr="22:22:22:33:44:55"

# SecureElement
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2-service-gto

PRODUCT_COPY_FILES += \
    device/google/raviole/nfc/libse-gto-hal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml \
	device/google/raviole/nfc/libnfc-hal-st-disable.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

PRODUCT_PACKAGES += \
	NfcNci \
	Tag \
	android.hardware.nfc-service.st

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2-service-gto

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml \
        device/google/raviole/nfc/libse-gto-hal.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal.conf \
	device/google/raviole/nfc/libse-gto-hal2.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libse-gto-hal2.conf

DEVICE_MANIFEST_FILE += \
	device/google/raviole/nfc/manifest_se.xml

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += device/google/raviole/powerstats/slider

# Trusty liboemcrypto.so
PRODUCT_SOONG_NAMESPACES += vendor/google_devices/raviole/prebuilts

# Bluetooth HAL
PRODUCT_PACKAGES += \
	bt_vendor.conf

# tetheroffload HAL
PRODUCT_PACKAGES += \
	vendor.samsung_slsi.hardware.tetheroffload@1.1-service

# Power HAL config
PRODUCT_COPY_FILES += \
	device/google/raviole/powerhint-slider.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# This device is shipped with 31 (Android S)
PRODUCT_SHIPPING_API_LEVEL := 31

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml
