# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/Ux876/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_Ux876
PRODUCT_DEVICE := Ux876
PRODUCT_MODEL := ZTE Ux876
PRODUCT_LOCALES := zh_CN en_US

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Term \
    gralloc.Ux876 \
    copybit.Ux876 \
    gps.Ux876 \
    libOmxCore \
    libOmxVidEnc \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/Ux876/Ux876-vendor.mk)

DISABLE_DEXPREOPT := false


PRODUCT_COPY_FILES += \
    device/zte/Ux876/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/Ux876/Ux876_keypad.kl:system/usr/keylayout/Ux876_keypad.kl

#system patch
PRODUCT_COPY_FILES += \
    device/zte/Ux876/system/bin/touch_to_key:system/bin/touch_to_key \
    device/zte/Ux876/system/bin/dexopt-wrapper:system/bin/dexopt-wrapper \
    device/zte/Ux876/system/app/RootExplorer.apk:system/app/RootExplorer.apk \
    device/zte/Ux876/system/app/SystemInfoPro.apk:system/app/SystemInfoPro.apk \
    device/zte/Ux876/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/zte/Ux876/system/etc/enhanced.conf:system/etc/enhanced.conf \
    device/zte/Ux876/system/etc/gps.conf:system/etc/gps.conf \
    device/zte/Ux876/system/lib/hw/copybit.Ux876.so:system/lib/hw/copybit.Ux876.so \
    device/zte/Ux876/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/zte/Ux876/system/lib/hw/gralloc.Ux876.so:system/lib/hw/gralloc.Ux876.so \
    device/zte/Ux876/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
    device/zte/Ux876/system/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
    device/zte/Ux876/system/usr/keychars/Ux876_keypad.kcm.bin:system/usr/keychars/Ux876_keypad.kcm.bin

# prebuilt vold
PRODUCT_COPY_FILES += \
    device/zte/Ux876/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/Ux876/ramdisk/init.Ux876.rc:root/init.Ux876.rc \
    device/zte/Ux876/ramdisk/ueventd.Ux876.rc:root/ueventd.Ux876.rc

# LOGO
PRODUCT_COPY_FILES += \
    device/zte/Ux876/ramdisk/initlogo.rle:root/initlogo.rle

# Geno script
PRODUCT_COPY_FILES += \
    device/zte/Ux876/ramdisk/sbin/geno:root/sbin/geno \
    device/zte/Ux876/ramdisk/sbin/odex:root/sbin/odex \
    device/zte/Ux876/ramdisk/sbin/timing:root/sbin/timing \
    device/zte/Ux876/ramdisk/sbin/gk/1-app2sd.sh:root/sbin/gk/1-app2sd.sh \
    device/zte/Ux876/ramdisk/sbin/gk/2-data2ext.sh:root/sbin/gk/2-data2ext.sh \
    device/zte/Ux876/ramdisk/sbin/gk/3-swap.sh:root/sbin/gk/3-swap.sh \
    device/zte/Ux876/ramdisk/sbin/gk/4-optimize.sh:root/sbin/gk/4-optimize.sh \
    device/zte/Ux876/ramdisk/sbin/gk/5-backup.sh:root/sbin/gk/5-backup.sh \
    device/zte/Ux876/ramdisk/sbin/gk/6-restore.sh:root/sbin/gk/6-restore.sh \
    device/zte/Ux876/ramdisk/sbin/gk/readme.txt:root/sbin/gk/readme.txt

# Audio
PRODUCT_COPY_FILES += \
    device/zte/Ux876/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/Ux876/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/Ux876/init.bt.sh:system/etc/init.bt.sh \
    device/zte/Ux876/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/Ux876/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/Ux876/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko \
    device/zte/Ux876/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/Ux876/prebuilt/hostapd:system/bin/hostapd \
    device/zte/Ux876/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=0 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai

# Ux876 uses mide-density artwork where available
PRODUCT_LOCALES += mdpi ldpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=120 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.build.baseband_version=P729BB01 \
    ro.telephony.default_network=0 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=24m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

