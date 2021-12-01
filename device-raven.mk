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

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-raven.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raven/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/raven/device-vendor-raven.mk)
$(call inherit-product-if-exists, vendor/google/camera/devices/raviole/raven/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/WallpapersRaven.mk)

DEVICE_PACKAGE_OVERLAYS += device/google/raviole/raven/overlay

include device/google/raviole/audio/raven/audio-tables.mk
include device/google/gs101/device-shipping-common.mk
include device/google/gs101/fingerprint/udfps_common.mk

ifeq ($(filter factory_raven, $(TARGET_PRODUCT)),)
include device/google/gs101/fingerprint/udfps_shipping.mk
else
include device/google/gs101/fingerprint/udfps_factory.mk
endif

ifeq ($(filter factory_raven, $(TARGET_PRODUCT)),)
include device/google/gs101/uwb/uwb.mk
endif

include hardware/google/pixel/vibrator/cs40l25/device.mk

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.support_kernel_idle_timer=true
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.enable_frame_rate_override=true

# Init files
PRODUCT_COPY_FILES += \
	device/google/raviole/conf/init.raviole.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.raviole.rc \
	device/google/raviole/conf/init.raven.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.raven.rc

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.raven.rc

# insmod files
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.raven.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/init.insmod.raven.cfg

# Thermal Config
PRODUCT_COPY_FILES += \
	device/google/raviole/thermal_info_config_raven.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json

# Bluetooth
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.a2dp_aac.vbr_supported=true

# Bluetooth Tx power caps for raven
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth_power_limits_raven.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_raven_us.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_US.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_raven_eu.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_EU.csv \
    $(LOCAL_PATH)/bluetooth_power_limits_raven_jp.csv:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_power_limits_JP.csv


# Bluetooth SAR test tool
PRODUCT_PACKAGES_DEBUG += \
    sar_test

# MIPI Coex Configs
PRODUCT_COPY_FILES += \
	device/google/raviole/radio/raven_camera_rear_tele_mipi_coex_table.csv:$(TARGET_COPY_OUT_VENDOR)/etc/modem/camera_rear_tele_mipi_coex_table.csv

# Camera
PRODUCT_COPY_FILES += \
	device/google/raviole/media_profiles_raven.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Display Config
PRODUCT_COPY_FILES += \
	device/google/raviole/raven/display_golden_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_golden_cal0.pb \
	device/google/raviole/raven/display_colordata_dev_cal0.pb:$(TARGET_COPY_OUT_VENDOR)/etc/display_colordata_dev_cal0.pb

#config of display brightness dimming
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.brightness.dimming.usage=2

# NFC
PRODUCT_COPY_FILES += \
	device/google/raviole/nfc/libnfc-hal-st.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-hal-st.conf \
	device/google/raviole/nfc/libnfc-nci-raven.conf:$(TARGET_COPY_OUT_PRODUCT)/etc/libnfc-nci.conf

DEVICE_MANIFEST_FILE += \
	device/google/gs101/nfc/manifest_se_gs101.xml

# Vibrator HAL
PRODUCT_PRODUCT_PROPERTIES +=\
    ro.vendor.vibrator.hal.long.frequency.shift=15
PRODUCT_PRODUCT_PROPERTIES += \
        vendor.powerhal.adpf.rate=8333333

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

# Display LBE
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.lbe.supported=1

# Media Performance Class 12
PRODUCT_PROPERTY_OVERRIDES += ro.odm.build.media_performance_class=31

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/raviole/powerstats/raven \
    device/google/raviole


# userdebug specific
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
    PRODUCT_COPY_FILES += \
        device/google/gs101/init.hardware.wlc.rc.userdebug:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.$(PRODUCT_PLATFORM).wlc.rc
endif

# Increment the SVN for any official public releases
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.build.svn=11

# Hide cutout overlays
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# Fingerprint antispoof property
PRODUCT_PRODUCT_PROPERTIES +=\
    persist.vendor.fingerprint.disable.fake.override=none

# Keyboard side padding in dp for portrait mode
PRODUCT_PRODUCT_PROPERTIES += ro.com.google.ime.kb_pad_port_r=11
PRODUCT_PRODUCT_PROPERTIES += ro.com.google.ime.kb_pad_port_l=11

# DCK properties based on target
PRODUCT_PROPERTY_OVERRIDES += \
    ro.gms.dck.eligible_wcc=2

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayGF5KQ \
    SettingsOverlayGLU0G \
    SettingsOverlayG8V0U

# Trusty liboemcrypto.so
PRODUCT_SOONG_NAMESPACES += vendor/google_devices/raviole/prebuilts

# Set support one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Enable camera exif model/make reporting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.exif_reveal_make_model=true
