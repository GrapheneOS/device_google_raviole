#
# Copyright 2019 The Android Open-Source Project
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
$(call inherit-product, device/google/gs101/aosp_common.mk)
$(call inherit-product, device/google/raviole/device-slider.mk)

PRODUCT_NAME := aosp_slider
PRODUCT_DEVICE := slider
PRODUCT_MODEL := AOSP on Slider
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := Google

# Most sliders don't have dauntless chip, set it as default
BOARD_WITHOUT_DTLS := true
