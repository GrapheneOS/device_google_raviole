#!/bin/sh

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

source ../../../common/clear-factory-images-variables.sh
BUILD=7192822
DEVICE=oriole
PRODUCT=oriole
VERSION=SD1A.210308.004
SRCPREFIX=signed-
BOOTLOADER=slider-1.0-7187550
RADIO=g5123x-76938-210114-B-7081606|g5123b-80386-210305-B-7187092
source ../../../common/generate-factory-images-common.sh
