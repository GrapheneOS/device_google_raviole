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

PRODUCT_SOONG_NAMESPACES += \
    vendor/google_devices/raven/proprietary \

# AOSP packages required by the blobs
PRODUCT_PACKAGES := \
    ShannonQualifiedNetworksService \
    ShannonIms \
    ShannonRcs \

PRODUCT_PACKAGES += \
    libmediaadaptor \

#  blob(s) necessary for raven hardware
PRODUCT_COPY_FILES := \
    vendor/google_devices/raven/proprietary/com.shannon.imsservice.xml:system_ext/etc/permissions/com.shannon.imsservice.xml:samsung \
    vendor/google_devices/raven/proprietary/com.shannon.qualifiednetworksservice.xml:system_ext/etc/permissions/com.shannon.qualifiednetworksservice.xml:samsung \
    vendor/google_devices/raven/proprietary/com.shannon.rcsservice.xml:system_ext/etc/permissions/com.shannon.rcsservice.xml:samsung \
    vendor/google_devices/raven/proprietary/oemrilhook.xml:system_ext/etc/permissions/oemrilhook.xml:samsung \
    vendor/google_devices/raven/proprietary/oemrilhook.jar:system_ext/framework/oemrilhook.jar:samsung \

