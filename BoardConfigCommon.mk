# Copyright (C) 2012 The CyanogenMod Project
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

# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm8660-common/include

# common kernel source
TARGET_KERNEL_SOURCE        := kernel/samsung/msm8660

# Platform
TARGET_BOARD_PLATFORM := msm8660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

# Architecture
TARGET_CPU_VARIANT := cortex-a8

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
QCOM_ADSP_SSR_ENABLED := false
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/msm8660-common/bluetooth/vnd_msm8660.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Camera
BOARD_CAMERA_USE_MM_HEAP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_CAMERA_ABI_HACK
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging

# CMHW
BOARD_HARDWARE_CLASS += device/samsung/msm8660-common/cmhw

# Display
BOARD_EGL_CFG := device/samsung/msm8660-common/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_NO_INITLOGO := true
TARGET_DISPLAY_USE_RETIRE_FENCE := true

#TARGET_BOOTANIMATION_PRELOAD := true
#BOARD_USES_LEGACY_MMAP := true
#COMMON_GLOBAL_CFLAGS += -DNEW_ION_API
#TARGET_NO_ADAPTIVE_PLAYBACK := true

# External apps on SD
TARGET_EXTERNAL_APPS = sdcard1

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# GPS
#BOARD_HAVE_NEW_QC_GPS := true

# Logging
#TARGET_USES_LOGD := false

# Media
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true <last one disabled

# Power
#TARGET_POWERHAL_VARIANT := qcom
TARGET_USES_CM_POWERHAL := true

# Qualcomm support
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Recovery
#BOARD_CUSTOM_GRAPHICS := ../../../device/samsung/msm8660-common/recovery/graphics.c
TARGET_RECOVERY_FSTAB := device/samsung/msm8660-common/rootdir/etc/fstab.qcom

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/samsung/msm8660-common

# RIL
#BOARD_RIL_CLASS := ../../../device/samsung/msm8660-common/ril

# SELinux

include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/samsung/msm8660-common/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth.te \
    bootanim.te \
    device.te \
    file.te \
    file_contexts \
    genfs_contexts \
    init_shell.te \
    kernel.te \
    keypad_dev.te \
    macloader.te \
    mediaserver.te \
    mm-qcamerad.te \
    mpdecision.te \
    netmgrd.te \
    orientationd.te \
    platform_app.te \
    qmuxd.te \
    rild.te \
    rmt_storage.te \
    surfaceflinger.te \
    sysinit.te \
    system_app.te \
    system_server.te \
    thermal-engine.te \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa.te

# Wifi related defines
BOARD_HAVE_SAMSUNG_WIFI := true
BOARD_WLAN_DEVICE := bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/wifi/bcmdhd_p2p.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 28
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

