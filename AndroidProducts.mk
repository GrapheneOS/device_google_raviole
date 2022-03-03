#
# Copyright (C) 2019 The Android Open-Source Project
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

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/aosp_oriole.mk \
    $(LOCAL_DIR)/aosp_oriole_pkvm.mk \
    $(LOCAL_DIR)/aosp_oriole_64.mk \
    $(LOCAL_DIR)/factory_oriole.mk \
    $(LOCAL_DIR)/aosp_raven.mk \
    $(LOCAL_DIR)/aosp_raven_pkvm.mk \
    $(LOCAL_DIR)/aosp_raven_64.mk \
    $(LOCAL_DIR)/factory_raven.mk \
    $(LOCAL_DIR)/aosp_slider.mk \
    $(LOCAL_DIR)/aosp_slider_hwasan.mk \
    $(LOCAL_DIR)/factory_slider.mk \
    $(LOCAL_DIR)/full_slider.mk \
    $(LOCAL_DIR)/aosp_whitefin.mk \
    $(LOCAL_DIR)/aosp_whitefin_pkvm.mk \
    $(LOCAL_DIR)/aosp_whitefin_hwasan.mk \
    $(LOCAL_DIR)/aosp_whitefin_64.mk \
    $(LOCAL_DIR)/factory_whitefin.mk

COMMON_LUNCH_CHOICES := \
    aosp_slider-userdebug \
    aosp_whitefin-userdebug \
    aosp_oriole-userdebug \
    aosp_raven-userdebug
