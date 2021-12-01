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

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/oriole/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/oriole/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google/camera/devices/raviole/oriole/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/WallpapersOriole.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/oriole/overlay

include device/google/raviole/audio/oriole/audio-tables.mk
include device/google/gs101/device-shipping-common.mk
include device/google/gs101/fingerprint/udfps_common.mk
include hardware/google/pixel/vibrator/cs40l25/device.mk

ifeq ($(filter factory_oriole, $(TARGET_PRODUCT)),)
include device/google/gs101/fingerprint/udfps_shipping.mk
else
include device/google/gs101/fingerprint/udfps_factory.mk
endif


# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.raviole.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.raviole.rc \
	device/google/raviole/conf/init.oriole.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.oriole.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.oriole.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.oriole.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.oriole.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
	device/google/raviole/thermal_info_config_oriole.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
	device/google/raviole/thermal_info_config_oriole_WHI_A.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config_WHI_A.json

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# Bluetooth Tx power caps for oriole
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth_power_limits_oriole.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_oriole_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_JP.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_G9S9B_US.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G9S9B_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_GB7N6_US.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GB7N6_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_G9S9B_EU.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_G9S9B_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_GB7N6_EU.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_GB7N6_EU.csv


# Bluetooth SAR test tool
PRODUCT_PACKAGES_DEBUG += \
    sar_test

# MIPI Coex Configs
PRODUCT_COPY_FILES += \
    device/google/raviole/radio/oriole_display_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/display_primary_mipi_coex_table.csv \
    device/google/raviole/radio/oriole_camera_front_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_front_mipi_coex_table.csv \
    device/google/raviole/radio/oriole_camera_rear_wide_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_rear_wide_mipi_coex_table.csv

# Camera
PRODUCT_COPY_FILES += \
	device/google/raviole/media_profiles_oriole.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Display Config
PRODUCT_COPY_FILES += \
	device/google/raviole/oriole/display_golden_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_golden_cal0.pb \
	device/google/raviole/oriole/display_colordata_dev_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_colordata_dev_cal0.pb

# NFC
PRODUCT_COPY_FILES += \
	device/google/raviole/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf


DEVICE_MANIFEST_FILE += \
	device/google/gs101/nfc/manifest_se_gs101.xml

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vendor.vibrator.hal.long.frequency.shift=15
PRODUCT_PRODUCT_PROPERTIES += \
        vendor.powerhal.adpf.rate=11111111

# Voice packs for Text-To-Speech
PRODUCT_COPY_FILES += \
	device/google/raviole/tts/ja-jp/ja-jp-x-multi-darwinn-wavernn-r27.zvoice:product/tts/google/ja-jp/ja-jp-x-multi-darwinn-wavernn-r27.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-multi-r27.zvoice:product/tts/google/ja-jp/ja-jp-x-multi-r27.zvoice\
	device/google/raviole/tts/ja-jp/ja-jp-x-multi-wavernn-r27.zvoice:product/tts/google/ja-jp/ja-jp-x-multi-wavernn-r27.zvoice\
	device/google/raviole/tts/fr-fr/fr-fr-x-multi-darwinn-wavernn-r27.zvoice:product/tts/google/fr-fr/fr-fr-x-multi-darwinn-wavernn-r27.zvoice\
	device/google/raviole/tts/fr-fr/fr-fr-x-multi-r27.zvoice:product/tts/google/fr-fr/fr-fr-x-multi-r27.zvoice\
	device/google/raviole/tts/fr-fr/fr-fr-x-multi-wavernn-r27.zvoice:product/tts/google/fr-fr/fr-fr-x-multi-wavernn-r27.zvoice\
	device/google/raviole/tts/de-de/de-de-x-multi-darwinn-wavernn-r27.zvoice:product/tts/google/de-de/de-de-x-multi-darwinn-wavernn-r27.zvoice\
	device/google/raviole/tts/de-de/de-de-x-multi-r27.zvoice:product/tts/google/de-de/de-de-x-multi-r27.zvoice\
	device/google/raviole/tts/de-de/de-de-x-multi-wavernn-r27.zvoice:product/tts/google/de-de/de-de-x-multi-wavernn-r27.zvoice\
	device/google/raviole/tts/it-it/it-it-x-multi-r24.zvoice:product/tts/google/it-it/it-it-x-multi-r24.zvoice\
	device/google/raviole/tts/es-es/es-es-x-multi-darwinn-wavernn-r27.zvoice:product/tts/google/es-es/es-es-x-multi-darwinn-wavernn-r27.zvoice\
	device/google/raviole/tts/es-es/es-es-x-multi-r27.zvoice:product/tts/google/es-es/es-es-x-multi-r27.zvoice\
	device/google/raviole/tts/es-es/es-es-x-multi-wavernn-r27.zvoice:product/tts/google/es-es/es-es-x-multi-wavernn-r27.zvoice

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/raviole/powerstats/oriole \
    device/google/raviole

# Keyboard bottom padding in dp for portrait mode
PRODUCT_PRODUCT_PROPERTIES += ro.com.google.ime.kb_pad_port_b=10

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.lbe.supported=1
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.set_idle_timer_ms=1500

# Media Performance Class 12
PRODUCT_PROPERTY_OVERRIDES += ro.odm.build.media_performance_class=31

# userdebug specific
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_COPY_FILES += \
        device/google/gs101/init.hardware.wlc.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_PLATFORM).wlc.rc
endif

# Increment the SVN for any official public releases
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.svn=12

# Hide cutout overlays
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayGR1YH \
    SettingsOverlayGB7N6 \
    SettingsOverlayG9S9B

# Fingerprint antispoof property
PRODUCT_PRODUCT_PROPERTIES +=\
    persist.vendor.fingerprint.disable.fake.override=none

# DCK properties based on target
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gms.dck.eligible_wcc=2

# Trusty liboemcrypto.so
PRODUCT_SOONG_NAMESPACES += vendor/google_devices/raviole/prebuilts

# Set support one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Enable camera exif model/make reporting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.exif_reveal_make_model=true
