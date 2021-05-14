# Copyright 2021 The Android Open Source Project
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

BOARD_PREBUILT_VENDORIMAGE := vendor/google_devices/oriole/proprietary/vendor.img

BOARD_PREBUILT_VENDOR_DLKMIMAGE := vendor/google_devices/oriole/proprietary/vendor_dlkm.img

TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm

AB_OTA_PARTITIONS += \
    vendor \
    vendor_dlkm \

-include vendor/google/tools/android-info.mk
ifdef USE_ANDROID_INFO
  TARGET_BOARD_INFO_FILE := vendor/google_devices/oriole/android-info.txt
endif

VENDOR_BLOBS_LICENSE := vendor/google_devices/oriole/LICENSE
