#
# Copyright (C) 2022 The Pixel Experience Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),fleur,miel,miel_p)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif