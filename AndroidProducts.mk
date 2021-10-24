#
# Copyright (C) 2022 The Pixel Experience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Device path
DEVICE_PATH := device/xiaomi/fleur

PRODUCT_MAKEFILES := \
    $(DEVICE_PATH)/aosp_fleur.mk

COMMON_LUNCH_CHOICES := \
    aosp_fleur-user \
    aosp_fleur-userdebug \
    aosp_fleur-eng