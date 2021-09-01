#
# Copyright (C) 2020 Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Device path
DEVICE_PATH := device/xiaomi/fleur

# Inherit virtual_ab_ota product
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    product \
    vendor \
    vbmeta \
    vbmeta_system

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client


# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 30

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6781:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6781

# Init
PRODUCT_PACKAGES += \
    init.mt6781.rc \
    fstab.mt6781

# Screen density
PRODUCT_AAPT_CONFIG := xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \
    $(LOCAL_PATH)/media/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml \
    $(LOCAL_PATH)/media/media_codecs_mediatek_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_audio.xml \
    $(LOCAL_PATH)/media/media_codecs_mediatek_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_mediatek_video.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.fleur.rc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Wi-Fi and Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# RcsService
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml
