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

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/oriole/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/oriole/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google/camera/devices/raviole/oriole/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/oriole/overlay

include device/google/gs101/device-shipping-common.mk
include device/google/raviole/audio/oriole/audio-tables.mk
include hardware/google/pixel/vibrator/cs40l25/device.mk

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.oriole.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.oriole.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.oriole.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.oriole.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.oriole.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
	device/google/raviole/thermal_info_config_oriole.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# MIPI Coex Configs
PRODUCT_COPY_FILES += \
    device/google/raviole/radio/oriole_display_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/display_primary_mipi_coex_table.csv

# Camera
PRODUCT_COPY_FILES += \
	device/google/raviole/media_profiles_oriole.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# NFC
PRODUCT_COPY_FILES += \
	device/google/raviole/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf


DEVICE_MANIFEST_FILE += \
	device/google/gs101/nfc/manifest_se_gs101.xml

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vendor.vibrator.hal.long.frequency.shift=15

# Voice packs for Text-To-Speech
PRODUCT_COPY_FILES += \
	device/google/gs101/tts/ja-jp/ja-jp-x-htm-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-htm-r22.zvoice\
	device/google/gs101/tts/ja-jp/ja-jp-x-jaa-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-jaa-r22.zvoice\
	device/google/gs101/tts/ja-jp/ja-jp-x-jab-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-jab-r22.zvoice\
	device/google/gs101/tts/ja-jp/ja-jp-x-jac-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-jac-r22.zvoice\
	device/google/gs101/tts/ja-jp/ja-jp-x-jad-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-jad-r22.zvoice\
	device/google/gs101/tts/ja-jp/ja-jp-x-mfk-r22.zvoice:product/tts/google/ja-jp/ja-jp-x-mfk-r22.zvoice\
	device/google/gs101/tts/fr-fr/fr-fr-x-multi-r23.zvoice:product/tts/google/fr-fr/fr-fr-x-multi-r23.zvoice\
	device/google/gs101/tts/de-de/de-de-x-multi-r23.zvoice:product/tts/google/de-de/de-de-x-multi-r23.zvoice\
	device/google/gs101/tts/it-it/it-it-x-amb-r21.zvoice:product/tts/google/it-it/it-it-x-amb-r21.zvoice\
	device/google/gs101/tts/it-it/it-it-x-ita-r21.zvoice:product/tts/google/it-it/it-it-x-ita-r21.zvoice\
	device/google/gs101/tts/it-it/it-it-x-itb-r21.zvoice:product/tts/google/it-it/it-it-x-itb-r21.zvoice\
	device/google/gs101/tts/it-it/it-it-x-itc-r21.zvoice:product/tts/google/it-it/it-it-x-itc-r21.zvoice\
	device/google/gs101/tts/it-it/it-it-x-itd-r21.zvoice:product/tts/google/it-it/it-it-x-itd-r21.zvoice\
	device/google/gs101/tts/it-it/it-it-x-kda-r21.zvoice:product/tts/google/it-it/it-it-x-kda-r21.zvoice\
	device/google/gs101/tts/es-es/es-es-x-ana-r22.zvoice:product/tts/google/es-es/es-es-x-ana-r22.zvoice\
	device/google/gs101/tts/es-es/es-es-x-multi-r22.zvoice:product/tts/google/es-es/es-es-x-multi-r22.zvoice

# Keyboard bottom padding in dp for portrait mode
PRODUCT_PRODUCT_PROPERTIES += ro.com.google.ime.kb_pad_port_b=10
