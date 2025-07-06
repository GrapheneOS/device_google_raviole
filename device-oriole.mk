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

# Restrict the visibility of Android.bp files to improve build analysis time
$(call inherit-product-if-exists, vendor/google/products/sources_pixel.mk)

ifdef RELEASE_GOOGLE_ORIOLE_RADIO_DIR
RELEASE_GOOGLE_PRODUCT_RADIO_DIR := $(RELEASE_GOOGLE_ORIOLE_RADIO_DIR)
endif
RELEASE_GOOGLE_BOOTLOADER_ORIOLE_DIR ?= pdk# Keep this for pdk TODO: b/327119000
RELEASE_GOOGLE_PRODUCT_BOOTLOADER_DIR := bootloader/$(RELEASE_GOOGLE_BOOTLOADER_ORIOLE_DIR)
$(call soong_config_set,raviole_bootloader,prebuilt_dir,$(RELEASE_GOOGLE_BOOTLOADER_ORIOLE_DIR))


TARGET_LINUX_KERNEL_VERSION := $(RELEASE_KERNEL_ORIOLE_VERSION)
# Keeps flexibility for kasan and ufs builds
TARGET_KERNEL_DIR ?= $(RELEASE_KERNEL_ORIOLE_DIR)
TARGET_BOARD_KERNEL_HEADERS ?= $(RELEASE_KERNEL_ORIOLE_DIR)/kernel-headers

$(call inherit-product-if-exists, vendor/google_devices/raviole/prebuilts/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/prebuilts/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/gs101/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/oriole/proprietary/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/oriole/device-vendor-oriole.mk)
$(call inherit-product-if-exists, vendor/google/camera/devices/raviole/oriole/device-vendor.mk)
$(call inherit-product-if-exists, vendor/google_devices/raviole/proprietary/WallpapersOriole.mk)

include device/google/gs101/device-shipping-common.mk
include device/google/gs101/telephony/pktrouter.mk
include device/google/gs-common/bcmbt/bluetooth.mk
include device/google/gs-common/touch/stm/stm11.mk

# Fingerprint HAL
GOODIX_CONFIG_BUILD_VERSION := g6_trusty
$(call inherit-product-if-exists, vendor/goodix/udfps/configuration/udfps_common.mk)
ifeq ($(filter factory%, $(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/goodix/udfps/configuration/udfps_shipping.mk)
else
$(call inherit-product-if-exists, vendor/goodix/udfps/configuration/udfps_factory.mk)
endif

# go/lyric-soong-variables
$(call soong_config_set,lyric,camera_hardware,oriole)
$(call soong_config_set,lyric,tuning_product,oriole)
$(call soong_config_set,google3a_config,target_device,oriole)

# sysconfig XML from stock
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/product-sysconfig-stock.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/product-sysconfig-stock.xml

# Recovery files
PRODUCT_COPY_FILES += \
	device/google/gs101/conf/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.oriole.rc

# TODO: This can probably be removed, but do it after we get a successful boot.
# insmod files. Kernel 5.10 prebuilts don't provide these yet, so provide our
# own copy if they're not in the prebuilts.
# TODO(b/369686096): drop this when 5.10 is gone.
ifeq ($(wildcard $(TARGET_KERNEL_DIR)/init.insmod.*.cfg),)
PRODUCT_COPY_FILES += \
	device/google/raviole/init.insmod.oriole.cfg:$(TARGET_COPY_OUT_VENDOR_DLKM)/etc/init.insmod.oriole.cfg
endif

# Bluetooth sepolicy
include device/google/gs101-sepolicy/oriole-sepolicy.mk

# userdebug specific
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
# Bluetooth LE Audio Hardware offload
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.leaudio_offload.supported=true \
    persist.bluetooth.leaudio_offload.disabled=true \
    persist.bluetooth.le_audio_test=false
endif

# NFC
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
	frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
	frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
	frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml \
	frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.uicc.xml \
	frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.ese.xml

PRODUCT_PACKAGES += \
	$(RELEASE_PACKAGE_NFC_STACK) \
	Tag \
	android.hardware.nfc-service.st

# Shared Modem Platform
SHARED_MODEM_PLATFORM_VENDOR := lassen

# Shared Modem Platform
include device/google/gs-common/modem/modem_svc_sit/shared_modem_platform.mk

# SecureElement
PRODUCT_PACKAGES += \
	android.hardware.secure_element@1.2-service-gto \
	android.hardware.secure_element@1.2-service-gto-ese2

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.ese.xml \
	frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.se.omapi.uicc.xml

DEVICE_MANIFEST_FILE += \
	device/google/raviole/nfc/manifest_se.xml

ACTUATOR_MODEL := luxshare_ict_081545

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += \
    device/google/raviole

# Set build properties for SMR builds
ifeq ($(RELEASE_IS_SMR), true)
    ifneq (,$(RELEASE_BASE_OS_ORIOLE))
        PRODUCT_BASE_OS := $(RELEASE_BASE_OS_ORIOLE)
    endif
endif

# Hide cutout overlays
PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# This device is shipped with 31 (Android S)
PRODUCT_SHIPPING_API_LEVEL := 31

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Disable AVF Remote Attestation
PRODUCT_AVF_REMOTE_ATTESTATION_DISABLED := true

# ETM
ifneq (,$(RELEASE_ETM_IN_USERDEBUG_ENG))
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
$(call inherit-product-if-exists, device/google/common/etm/device-userdebug-modules.mk)
endif
endif

# PlayVideos
PLAYVIDEOS_VERSION_DIR := 4.20.6
$(call soong_config_set_bool,playvideos,use_device_specific_version,true)
